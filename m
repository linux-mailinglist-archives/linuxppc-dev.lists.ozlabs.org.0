Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D33B382592
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 09:43:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FkB1t3nSbz2ykP
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 17:42:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=UFtpsgVR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031;
 helo=mail-pj1-x1031.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=UFtpsgVR; dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FkB1P37XFz2yWR
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 May 2021 17:42:32 +1000 (AEST)
Received: by mail-pj1-x1031.google.com with SMTP id
 b13-20020a17090a8c8db029015cd97baea9so4075747pjo.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 May 2021 00:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=P/KdnP4nwgl0oNC3j6na2E4K0eFgZ4XpiZ9Ts+1Vwkg=;
 b=UFtpsgVRGB0Qo1PD+jv40tyDuXtKoAAfK7BXYc2ZLOZIyAv0Tz1p19YIxA/iHmRqlR
 fxFIy9mUSCDgmDdT5o11cfH7hRLSf78v/op/Hno3zYLTa9pDmrjahqZsuCYMuSfWE07r
 GEqGuoHPZ586A8BvLoRSj0sZ5+3HuAzxOUQ6wnFQGSirgMFfF4EnW+ajOKCtLfcSHeiI
 TtFBnxVkVCz7wVDl5dgVp7HbDAIXM13dTolEg4fnM2ighezc7DmOhy/uMcYTRzzu4V4p
 m04/e44w2UlIcy0uHgIK+J5F17arytBXkZZb5OlDpO3rm4z1HbQzyhEuLd3cIsg0xqIx
 yYXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=P/KdnP4nwgl0oNC3j6na2E4K0eFgZ4XpiZ9Ts+1Vwkg=;
 b=eIcF+/WbnZpdU4NdxQ0k0y4BoBDt19flEdNFFWR1N+S+ODk5X68jPthzrpI8AwyoWc
 bobC1rqVos2jJ7UVXpHTjnl7bLtGcfvZC808qHWC4fyn5JH1yW5/fowsAIVreCNPZw1u
 G5vqEcKWqCE2AEbNg8WU/w0hXa/gNV7CoFDsHJYhB01CmI7Eqk4O1zGpUG0rHCn2Aq9c
 24WgbzhmNFypzLLIGQhzk0w83uS5EV9nTIDkTIntNFl38FI+7aIvhvK/E9Dek66EEmZq
 WdVclNEFwI7i/giS9oHwsmb+C8NRx3VosLdp2+1KVKxsGlOaabEEWXTAHcofkwsW7WHP
 OSIg==
X-Gm-Message-State: AOAM5318tNW0GZyyCipOxAYraRYr3VBWcqB3QDEcl8bI0WvediDCf45X
 h0nmtTfka87z64U7GrESR6A=
X-Google-Smtp-Source: ABdhPJxAaQNPBams28CP2wyD2U67alh+QHySRu7vhtRqy2rC9h5cjvymDC95D9xFLOkrdHYRbNitjQ==
X-Received: by 2002:a17:90a:de09:: with SMTP id
 m9mr63977638pjv.41.1621237348803; 
 Mon, 17 May 2021 00:42:28 -0700 (PDT)
Received: from localhost (14-201-155-8.tpgi.com.au. [14.201.155.8])
 by smtp.gmail.com with ESMTPSA id 125sm2429130pfg.52.2021.05.17.00.42.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 00:42:28 -0700 (PDT)
Date: Mon, 17 May 2021 17:42:23 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [FSL P50x0] KVM HV doesn't work anymore
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Christian Zigotzky
 <chzigotzky@xenosoft.de>, "kvm-ppc@vger.kernel.org"
 <kvm-ppc@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
References: <04526309-4653-3349-b6de-e7640c2258d6@xenosoft.de>
 <34617b1b-e213-668b-05f6-6fce7b549bf0@xenosoft.de>
 <9af2c1c9-2caf-120b-2f97-c7722274eee3@csgroup.eu>
 <199da427-9511-34fe-1a9e-08e24995ea85@xenosoft.de>
In-Reply-To: <199da427-9511-34fe-1a9e-08e24995ea85@xenosoft.de>
MIME-Version: 1.0
Message-Id: <1621236734.xfc1uw04eb.astroid@bobo.none>
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
Cc: Darren Stevens <darren@stevens-zone.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 mad skateman <madskateman@gmail.com>, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christian Zigotzky's message of May 15, 2021 11:46 pm:
> On 15 May 2021 at 12:08pm Christophe Leroy wrote:
>>
>>
>> Le 15/05/2021 =C3=A0 11:48, Christian Zigotzky a =C3=A9crit=C2=A0:
>>> Hi All,
>>>
>>> I bisected today [1] and the bisecting itself was OK but the=20
>>> reverting of the bad commit doesn't solve the issue. Do you have an=20
>>> idea which commit could be resposible for this issue? Maybe the=20
>>> bisecting wasn't successful. I will look in the kernel git log. Maybe=20
>>> there is a commit that affected KVM HV on FSL P50x0 machines.
>>
>> If the uImage doesn't load, it may be because of the size of uImage.
>>
>> See https://github.com/linuxppc/issues/issues/208
>>
>> Is there a significant size difference with and without KVM HV ?
>>
>> Maybe you can try to remove another option to reduce the size of the=20
>> uImage.
> I tried it but it doesn't solve the issue. The uImage works without KVM=20
> HV in a virtual e5500 QEMU machine.

Any more progress with this? I would say that bisect might have just
been a bit unstable and maybe by chance some things did not crash so
it's pointing to the wrong patch.

Upstream merge of powerpc-5.13-1 was good and powerpc-5.13-2 was bad?

Between that looks like some KVM MMU rework. You could try the patch
before this one b1c5356e873c ("KVM: PPC: Convert to the gfn-based MMU=20
notifier callbacks"). That won't revert cleanly so just try run the
tree at that point. If it works, test the patch and see if it fails.

Thanks,
Nick
