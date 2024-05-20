Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id 78F538C9F4A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2024 17:06:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FrClGA08;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vjgj74r2bz3fxM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2024 01:00:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FrClGA08;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=oohall@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VjghR1kGTz3dKp
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 May 2024 00:59:34 +1000 (AEST)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1ecddf96313so61487665ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 May 2024 07:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716217173; x=1716821973; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9WxWSnAu+Jb/cU8HRp03QI7vnLcxoh48uyOd12Dtm1w=;
        b=FrClGA08eZ7+qiBWVn4Newt4ZEodujxLOLLUhK/xaAG6Ma9ZwNdm573m/OSgAIvEAS
         z9VYuujBoCTTgYNRNK7Kq/1bh7TjCiuRRPKaioPR+MSJqLk9l1si+9jg61oLQEkCaGLY
         1zYYkJL0QBx9asGzVudkct/tMgG4XhWGesa8y9PitRpKOSOp04+Kioy312Y/IHn8lOeJ
         n8ZLCVhpYx5itVOXjjF5aYDlmPS4ZYI+r3F2wcnIXSLzdKu7sWu1BuC3n9hgN56JgQZI
         sJwghaQWGl8W61bjzVlSHCO81PdQ6RmVb4Osfgsx2SmCJIWu+wjYqh7q4f1brrK5WPmO
         RYTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716217173; x=1716821973;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9WxWSnAu+Jb/cU8HRp03QI7vnLcxoh48uyOd12Dtm1w=;
        b=UICfR2806Iq2u09eMpzX2RKWwL8IHG5gWqUP/6qpN+GpemEcVZeVKA8IWZgHERzbuC
         M9uiVeTwqIC28dG1xVbUb6MKWooNcCLZZoDL0pijrCfzVtFDgYHWqVrwrbhxG45sEsQr
         FgeooDQYHdl6+GxCKfAGyKPEJ1iBhC7ivBxIjhfUHLDXMCVU5vqvB7wV53AIJeoMZKP0
         fLGpgsedM6TRJBOpg/BowNPhWcawr+4h2D7zlYLMlRwJzbS2gc7M/Z4SD9MsOonCJNbx
         prGGIgQeLgYUjJjy2jgfUfXZSmjjKIGGwiNKgzjBKN+y1fqCUrPTLUgkPGbCACvy7/F5
         cfUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIT04TL05mBCMpnMDQOZ935GaaY1xYd+VyFzct+E7WLQYz5JYoaiPAgYlt4efhVAcpIQ51bMtXctJOxYCiaabuc9Fq9LaukLHCBWenJg==
X-Gm-Message-State: AOJu0YyBsH5wb5D8oueNPRs69pyAXTV+F74znRXxzbfuChfrAl3W59GL
	DD4jLEulwNBIT245QFNEUs/IxE+tGpDgpRu1nmQBG6Sfo8BG5ORcjba7A3PBIEy31y7jMlkhfWQ
	TxNaZkPrgAwzq1M0xI1xB5g/nZ0A=
X-Google-Smtp-Source: AGHT+IGfSE+YBGPcDTEKdMHB/BUDwvfllUws7NAWhT7CWSQLTeCfhkDPoRwDe/Brw4m7uUedxBN/qEqJBXOEGPAjlis=
X-Received: by 2002:a17:90b:4b4a:b0:2bd:7fc1:c91 with SMTP id
 98e67ed59e1d1-2bd7fc125acmr3299938a91.38.1716217172776; Mon, 20 May 2024
 07:59:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240514135303.176134-1-krishnak@linux.ibm.com>
 <20240514135303.176134-3-krishnak@linux.ibm.com> <CAOSf1CFDCTMdmrjoSRdP09rJgtzPVDnCPXpfS-S+J7XKHzKRCw@mail.gmail.com>
 <fd0e22ab-5998-4b57-828e-224dda6bf490@linux.ibm.com>
In-Reply-To: <fd0e22ab-5998-4b57-828e-224dda6bf490@linux.ibm.com>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Tue, 21 May 2024 00:59:19 +1000
Message-ID: <CAOSf1CE2r4Gju-BkGVzuAyWoiFZ+9csNMj=v+KkQMmixUAHH6w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] powerpc: hotplug driver bridge support
To: krishna kumar <krishnak@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Nathan Lynch <nathanl@linux.ibm.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, mahesh@linux.ibm.com, Gaurav Batra <gbatra@linux.ibm.com>, Bjorn Helgaas <bhelgaas@google.com>, Brian King <brking@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 17, 2024 at 9:15=E2=80=AFPM krishna kumar <krishnak@linux.ibm.c=
om> wrote:
>
> > Uh, if I'm reading this right it looks like your "slot" C5 is actually
> > the PCIe switch's internal bus which is definitely not hot pluggable.
>
> It's a hotplug slot. Please see the snippet below:
>
> :~$ sudo lspci -vvv -s 0004:02:00.0 | grep --color HotPlug
>          SltCap:    AttnBtn- PwrCtrl+ MRL- AttnInd- PwrInd- HotPlug+ Surp=
rise-
> :~$
>
> :~$ sudo lspci -vvv -s 0004:02:01.0 | grep --color HotPlug
>         SltCap:    AttnBtn- PwrCtrl+ MRL- AttnInd- PwrInd- HotPlug+ Surpr=
ise-
> :~$
>
> :~$ sudo lspci -vvv -s 0004:02:02.0 | grep --color HotPlug
>         SltCap:    AttnBtn- PwrCtrl+ MRL- AttnInd- PwrInd- HotPlug+ Surpr=
ise-
> :~$
>
> :~$ sudo lspci -vvv -s 0004:02:03.0 | grep --color HotPlug
>         SltCap:    AttnBtn- PwrCtrl+ MRL- AttnInd- PwrInd- HotPlug+ Surpr=
ise-
> :~$

All this is showing is that the switch downstream ports on bus 0004:02
have a slot capability. I already know that (see what I said
previously about physical links). The fact the downstream ports have a
slot capability also has absolutely nothing to do with anything I was
saying. Look at the lspci output for 0004:01:00.0 which is the
switch's upstream port. The upstream port device will not have a slot
capability because it's a bridge into the virtual PCI bus that is
internal to the switch.

> It seems like your explanation about the missing 0004:01:00.0 may be
> correct and could be due to a firmware bug. However, the scope of this
> patch does not relate to this issue. Additionally, if it starts with
> 0004:01:00.0 to 0004:01:03.0, the behavior of hot-unplug and hot-plug
> operations will remain inconsistent. This patch aims to address the
> inconsistent behavior of hot-unplug and hot-plug.
>
> *snip*
>
> > It might be worth adding some logic to pnv_php to verify the PCI
> > bridge upstream of the slot actually has the PCIe slot capability to
> > guard against this problem.
>
> We can have a look at this problem in another patch.

The point of this series is to fix the behaviour of pnv_php, is it
not? Powering off a PCI(e) slot is supposed to render it safe to
remove the card  in that slot. Currently if you "power off" C5, the
kernel is still going to have active references to the switch's
upstream port device (at 0004:01:00.0) and the switch management
function (at 0004:01:00.1). If the kernel has active references to PCI
devices physically located in the slot we supposedly powered off, then
the hotplug driver isn't doing its job. The asymmetry between hot add
and removal that you're trying to fix here is a side effect of the
fact that pnv_php is advertising the wrong thing as a slot. I think
you should stop pnv_php from advertising something as a slot when it's
not actually a slot because that's the root of all your problems.

> We wanted to handle the more generic case and did not want to be confined=
 to
> only one device assumption. We want to fix the current inconsistent behav=
ior
> more generically.

Right, as I said above I don't think handing the more generic case is
actually required if pnv_php is doing its job properly. It doesn't
hurt though.

> Regarding the fix, the fix is obvious:

really?

> We have to traverse
> and find the bridge ports from DT and invoke  pci_scan_slot() on them. Th=
is will
> discover and create the entry for bridge ports (0004:02:00.0 to 0004:02:0=
0.3 on
> the given bus- 0004:02). There is already an existing function, pci_scan_=
bridge()
> which is doing invocation of pci_scan_slot () for the devices behind the =
bridge,
> in this case for  SAS device. So eventually, we are doing a scan of all t=
he entities
> behind the slot.

I already read your patch so I'm not sure why you feel the need to
re-describe it in tedious detail.

> Would you like me to combine the non-bridge and bridge cases into one? I =
can attempt
> to do this. Hopefully, if we incorporate the iterate sibling logic case c=
orrectly,
> we may not need to maintain these two separate cases for bridge and non-b=
ridge. I
> will attempt this, and if it works, I will include it in the next patch. =
Thanks.

Yes, do that.

Also, do not post HTML emails to linux development lists. It breaks
plain text inline quoting which makes your messages annoying to reply
to. Some linux development lists will also silently drop HTML emails.
Please talk to the other LTC engineers about how to set up your mail
client to send plain text emails to avoid these problems in the
future.

Oliver
