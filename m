Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F9C33830F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Mar 2021 02:14:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DxSWs18Y1z3cn1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Mar 2021 12:14:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=vdo0+wYI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432;
 helo=mail-pf1-x432.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=vdo0+wYI; dkim-atps=neutral
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DxSWP6Hsyz30Nj
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Mar 2021 12:13:52 +1100 (AEDT)
Received: by mail-pf1-x432.google.com with SMTP id t29so723796pfg.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Mar 2021 17:13:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=fqgBQHGszJ1FJ/uJtib9M0dApRy7K5pmtaH0QVQ6w/E=;
 b=vdo0+wYIjZgxN1DHiAduyEanAb6xMs7pl6PHFhUQVCmfAgFSd2RNbjOFKI/L1rY+92
 hbfV8nmYDxlPo4Ur59e8+a8ppAenabXc2eXQvPMoJwbmuWfNff114lZaw1Rg5sR6Veb2
 OI5S2IeOA8CDDZ5IpDFo37yWixEWNriAqpJ6r9UfE0wnO8Yhs0TwKr+MnPmlVYzgqDM2
 DzU85n0RBEbwMOAVZkPrOlO4l2MsSZ34OpXIviaFOUQVRJpLnEP3qbxFhVMudI83LkBZ
 qhGN/RzbgoWxMqaM4gMi/WK59gHt5PFl0d8MRsPR98rfbbhprDda1yazuiAzRVuoCH40
 yAyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=fqgBQHGszJ1FJ/uJtib9M0dApRy7K5pmtaH0QVQ6w/E=;
 b=GkoUzfBYFSlbAGcMZr9x29PczPCBFV11TxdfVHXK6NoMpCeKLveEYiF6kctOQD0nDq
 MbSQYTXAYzzzz/wyOigkEih0UztAn0WvlwkoWBLb/uiPazmpwr6ptuMiGq6zQ3GQ+drR
 I/SoyHR8HY4BMHFnzGRno3ORF4FkOcpNKODYkM+hN8LvDmTu3IA+7GzZn/u2hI6AOprI
 /pCn62kJbMbeBjIkY3eOTOnlkhjiRPKz5b/mJhDVDGOo5Z438KPt0opUMbViYZfzY2SC
 p574H1ZzOcqEDMgkgz55RcYr7XuGiJz6XuKiOEpsHaLl1QAp9Z5XJ76dc/6t6oosvncz
 UR6w==
X-Gm-Message-State: AOAM531QZMBZ6ILp6ZAzUV9nmOlQnFvsmujb48C9Drbx7LmGZ8HDKdRI
 qsIngehxIrSb4WcjUYV9oHk=
X-Google-Smtp-Source: ABdhPJx249OAggnX/6S8Z7M8WlaUjbknMaYUtqTYcwA9ec64iRZMMUHTncGO8vWthXzdUlABbTCjXA==
X-Received: by 2002:a62:35c2:0:b029:1f1:3a8b:83d5 with SMTP id
 c185-20020a6235c20000b02901f13a8b83d5mr10032240pfa.29.1615511629491; 
 Thu, 11 Mar 2021 17:13:49 -0800 (PST)
Received: from localhost (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id k8sm277545pjj.31.2021.03.11.17.13.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 17:13:48 -0800 (PST)
Date: Fri, 12 Mar 2021 11:13:43 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] KVM: PPC: Book3S HV: Do not expose HFSCR sanitisation to
 nested hypervisor
To: Paul Mackerras <paulus@ozlabs.org>
References: <20210305231055.2913892-1-farosas@linux.ibm.com>
 <1615191200.1pjltfhe7o.astroid@bobo.none>
 <20210310092354.GA30597@blackberry>
In-Reply-To: <20210310092354.GA30597@blackberry>
MIME-Version: 1.0
Message-Id: <1615511004.vkyzd3ossi.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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
Cc: linuxppc-dev@lists.ozlabs.org, kvm-ppc@vger.kernel.org,
 Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Paul Mackerras's message of March 10, 2021 7:23 pm:
> On Mon, Mar 08, 2021 at 06:18:47PM +1000, Nicholas Piggin wrote:
>> Excerpts from Fabiano Rosas's message of March 6, 2021 9:10 am:
>> > As one of the arguments of the H_ENTER_NESTED hypercall, the nested
>> > hypervisor (L1) prepares a structure containing the values of various
>> > hypervisor-privileged registers with which it wants the nested guest
>> > (L2) to run. Since the nested HV runs in supervisor mode it needs the
>> > host to write to these registers.
>> >=20
>> > To stop a nested HV manipulating this mechanism and using a nested
>> > guest as a proxy to access a facility that has been made unavailable
>> > to it, we have a routine that sanitises the values of the HV registers
>> > before copying them into the nested guest's vcpu struct.
>> >=20
>> > However, when coming out of the guest the values are copied as they
>> > were back into L1 memory, which means that any sanitisation we did
>> > during guest entry will be exposed to L1 after H_ENTER_NESTED returns.
>> >=20
>> > This is not a problem by itself, but in the case of the Hypervisor
>> > Facility Status and Control Register (HFSCR), we use the intersection
>> > between L2 hfscr bits and L1 hfscr bits. That means that L1 could use
>> > this to indirectly read the (hv-privileged) value from its vcpu
>> > struct.
>> >=20
>> > This patch fixes this by making sure that L1 only gets back the bits
>> > that are necessary for regular functioning.
>>=20
>> The general idea of restricting exposure of HV privileged bits, but
>> for the case of HFSCR a guest can probe the HFCR anyway by testing which=
=20
>> facilities are available (and presumably an HV may need some way to know
>> what features are available for it to advertise to its own guests), so
>> is this necessary? Perhaps a comment would be sufficient.
>=20
> I would see it a bit differently.  From L1's point of view, L0 is the
> hardware.  The situation we have now is akin to writing a value to the
> real HFSCR, then reading HFSCR and finding that some of the facility
> enable bits have magically got set to zero.  That's not the way real
> hardware works, so L0 shouldn't behave that way either, or at least
> not without some strong justification.

But the features disallowed by the L0 have to be viewed as unimplemented=20
by the hardware so the bits would be reserved, so according to=20
architecture they actually are allowed to return zero.

That's not my concern though, and I do agree it is a bit odd. I don't=20
have a problem with leaving the FC field value unchanged.

I think at least printing a warning for unimplemented bits would be good=20
though.

Thanks,
Nick
