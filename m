Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD9A638380
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Nov 2022 06:31:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NJNkb3vkrz3dvc
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Nov 2022 16:31:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=a9VqojD0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NJNjg048Zz3010
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Nov 2022 16:30:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=a9VqojD0;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NJNjc6wVQz4x2c;
	Fri, 25 Nov 2022 16:30:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1669354214;
	bh=EsiGp1szyWNiHZ5wUGzk8Vc7Mu2R3iNcOrDOCAsGpu4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=a9VqojD0ONcxhe21GW3baCALkn7ejvQFE0BnSLR9SSwLQhPNOTWuGJ0EL5LsKLVJ+
	 rnnNLwk+J3NVdOijfHecWdC79mFBPzxVP4wIEIN5Yy2V2Ahg/Zey39X73p1BNLNdpZ
	 BmNpagswQtzSrXS8LHCyHbaRrO35IQrT9d0hgUgW0zLqFh8X1EDebSfX8xG4FmudGq
	 2x/UySpGlv9M1xssuFzoGB8XN4Av/qpdr55IqDypZexvw5VFp1YoKA9rqT0+Pc3+j4
	 7WFn65Gd4UD1I/WhM3Wf9GAhFQSWYTPEPiR045LZwyEZlt9AgDzWWZOc7/mjjkO4fV
	 f3ajW9uxBVCtA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 "zhang.songyi@zte.com.cn" <zhang.songyi@zte.com.cn>, "arnd@arndb.de"
 <arnd@arndb.de>
Subject: Re: [PATCH linux-next] powerpc/cell/axon_msi: replace
 DEFINE_SIMPLE_ATTRIBUTE with DEFINE_DEBUGFS_ATTRIBUTE
In-Reply-To: <9f6a3690-3ac3-8e13-a80c-b0571826c3d7@csgroup.eu>
References: <202211231706198927223@zte.com.cn>
 <9f6a3690-3ac3-8e13-a80c-b0571826c3d7@csgroup.eu>
Date: Fri, 25 Nov 2022 16:30:08 +1100
Message-ID: <87tu2nbnz3.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "npiggin@gmail.com" <npiggin@gmail.com>, deng.changcheng@zte.com.cn
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Hi,
>
> Le 23/11/2022 =C3=A0 10:06, zhang.songyi@zte.com.cn a =C3=A9crit=C2=A0:
>> From: zhang songyi <zhang.songyi@zte.com.cn>
>>=20
>> Fix the following coccicheck warning:
>> /arch/powerpc/platforms/cell/axon_msi.c:457:0-23: WARNING:
>> fops_msic should be defined with DEFINE_DEBUGFS_ATTRIBUTE
>
> What's the difference between this new patch and the one that is already=
=20
> awaiting application here :=20
> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20211222090655.48=
4551-1-deng.changcheng@zte.com.cn/=20
> ?
>
> The only difference I see it that the already existing patch has a more=20
> complete description of the change, so unless I'm missing something it=20
> would be nice to avoid sending the same changes again and again.

Both patches switch the code to use a function called "unsafe" without
adequately explaining why that is OK.

The commit that added the cocci check script says:

  If the original struct file_operations are known to be safe against remov=
al
  races by themselves already, the proxy creation may be bypassed by creati=
ng
  the files through debugfs_create_file_unsafe().

None of these conversion patches ever contain any explanation which
speaks to that.

In this case I *think* the change is OK and there is no race because the
debugfs file is never removed. But I really wish the submitter would
tell me that in the change log.

cheers
