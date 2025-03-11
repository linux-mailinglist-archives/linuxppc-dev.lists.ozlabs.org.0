Return-Path: <linuxppc-dev+bounces-6885-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EA964A5BBFE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Mar 2025 10:22:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZBpFl2c4Fz2yDr;
	Tue, 11 Mar 2025 20:22:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=136.143.188.112 arc.chain=zohomail.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741679789;
	cv=pass; b=btVVoPMIQfDWU7NOaOrercLRo5qINC/Lypi/fJ9obb81jXV2bySWJYTmATJJ0WMTCnfOClBgIDAwq+8RaanMUV/AUx/jkKep73eG0aoKfHI+K6lsk3/06IoTQTeklFDTZPX05xl0WaVUfmFnkYPAEEVmyhPUeyfGKLNEFvv96Q9p3kct4VrVagb9VwGUrDNWvXk+JN2LbDzGvolTlf780IUpY3IXJyPDZmUExMr64zc8t7Lui7hVWDbcbUlFYbRRaZGa8NTxXBod+OASN6EEeGzZ2Y0rg+k3VQehtszWNomAtxjvSlEZxiEADPB4cka35Kmw2aRHKZETGvTu1hOOQg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741679789; c=relaxed/relaxed;
	bh=rUxu9n8PWJK8TIneFd17PvzeUgHqtOvu2tZv8yp40q0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GKN5Wy/Hpo2m4YJPXW09o3V4iJ944aqQnyc22m3v8mQYeFDyEeML68M5KeiWNYUg5Ba5Xb9li6tL5RAPvNh0bdvTLhq1tp4Id+1CQRa30938f/P0qg8xtQxTtSfLZoB9UaT/sc80YeI+YVFyDg2VtkZIfW1qdGJUixhDAksxYAkwF686jlH8sy8EnnALhn2v6HS+FU01lAXtKq+GiZuYmc4pvkuDmgVQxjcCIDzFq4qkfvUDetzNfSMID26Z5vEDpiG/QUgKfWEB+GRvzNLFrai4RyElJV5tSW1wMP0781fEK1kF5+k05fLDAyR3spoA8zXeHKuvRttou5CP8BCbvw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=collabora.com; dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=Z9If5mae; dkim-atps=neutral; spf=pass (client-ip=136.143.188.112; helo=sender4-pp-f112.zoho.com; envelope-from=nicolas.frattaroli@collabora.com; receiver=lists.ozlabs.org) smtp.mailfrom=collabora.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=Z9If5mae;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=collabora.com (client-ip=136.143.188.112; helo=sender4-pp-f112.zoho.com; envelope-from=nicolas.frattaroli@collabora.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 908 seconds by postgrey-1.37 at boromir; Tue, 11 Mar 2025 18:56:27 AEDT
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZBmL369dTz3bmS
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Mar 2025 18:56:27 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741678872; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MJhSiQKukPtTuShQejA0RSWV7KKFmxqUrfq/CsZhbzBAJzMIS9hkibtJfIWN4KX1qvuXh3QFp83els47mloBQ+GXqjUrmKlgNH3+5DkQa9PTTnWcIp362dcno3tKSbbj+nui+JMAkoJR+7/dq3iHHDL2ILkv6+Xqkcp0QRUyoPU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1741678872; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=rUxu9n8PWJK8TIneFd17PvzeUgHqtOvu2tZv8yp40q0=; 
	b=VhquqaV+T7/RkZdjXbx+nFpkn6Eu1ZFXBTCGteIroX8Py4NRkWBz6pmcieXmhwOtjZa5E0LBIx5xvBtuVkwHv/4DXWmeoKnLXttyY1qQVeNZN9+Tyva/x0duz+0aYd/7AThDTj+SryJ9Oo0vBGYp3BVj7C1mfFOte5FiGgnQy/M=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741678872;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To:Cc;
	bh=rUxu9n8PWJK8TIneFd17PvzeUgHqtOvu2tZv8yp40q0=;
	b=Z9If5maeCv7yGZ/Xsg08ZcvYTveoMcZhhSAopHPvcoCY7JWGhF3P+tzvjFWRI2yF
	9mTIGlkobmpUrMSvQUJOi3s7myhb4gcMKjOJ0/FHokoadlNjoGktX7UTajD8dmDCvZG
	/mDaZ6+Iwh/PQXFJgWsPGYdvISHmkVX4L2a0L41A=
Received: by mx.zohomail.com with SMTPS id 1741678868033939.9054328647139;
	Tue, 11 Mar 2025 00:41:08 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Michael Ellerman <mpe@ellerman.id.au>, heiko@sntech.de,
 srinivas.kandagatla@linaro.org, Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Subject: Re: [linux-next-20250307] Build Failure
Date: Tue, 11 Mar 2025 08:41:04 +0100
Message-ID: <5867354.DvuYhMxLoT@workhorse>
In-Reply-To: <25306d01-db9d-42aa-9c26-2e18dfc30241@linux.ibm.com>
References:
 <70ba4e80-53c4-4583-82f3-2851e0829aa6@linux.ibm.com>
 <25306d01-db9d-42aa-9c26-2e18dfc30241@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tuesday, 11 March 2025 05:23:23 Central European Standard Time Venkat Rao 
Bagalkote wrote:
> Git Bisect is poinitng to commit:
> 3e081aa132bbefe31ac95dd6dfc8d787ffa83d0b as first bad commit.

That does not seem like a correct bisection to me. The build error isn't even 
in the same translation unit as the change the commit you landed on touches, 
much less any subsystem even remotely related to it.

> 
> Git bisect log:
> 
> git bisect start
> # status: waiting for both good and bad commits
> # bad: [0a2f889128969dab41861b6e40111aa03dc57014] Add linux-next
> specific files for 20250307
> git bisect bad 0a2f889128969dab41861b6e40111aa03dc57014
> # status: waiting for good commit(s), bad commit known
> # good: [7eb172143d5508b4da468ed59ee857c6e5e01da6] Linux 6.14-rc5
> git bisect good 7eb172143d5508b4da468ed59ee857c6e5e01da6
> # good: [7eb172143d5508b4da468ed59ee857c6e5e01da6] Linux 6.14-rc5
> git bisect good 7eb172143d5508b4da468ed59ee857c6e5e01da6
> # good: [80ec13b98c6378cbf9b29d7ee7d3db930ddbd858] Merge branch 'master'
> of git://git.kernel.org/pub/scm/linux/kernel/git/klassert/ipsec-next.git
> git bisect good 80ec13b98c6378cbf9b29d7ee7d3db930ddbd858
> # good: [6c60220c45270869a7c5f791f6e0197b1f0d0388] Merge branch
> 'driver-core-next' of
> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git
> git bisect good 6c60220c45270869a7c5f791f6e0197b1f0d0388
> # good: [187734f508b0a9a00ccaaf7d8ba05874b624ac73] Merge branch
> 'for-next' of
> git://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git
> git bisect good 187734f508b0a9a00ccaaf7d8ba05874b624ac73
> # good: [316ff3a28679b82eb2bf17c02dbca970e7433182] Merge branch
> 'for-next/seccomp' of
> git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git
> git bisect good 316ff3a28679b82eb2bf17c02dbca970e7433182
> # bad: [69759c9d8dd7df716dcca3601b82e5618332cef7] Merge branch
> 'rust-next' of https://github.com/Rust-for-Linux/linux.git
> git bisect bad 69759c9d8dd7df716dcca3601b82e5618332cef7
> # bad: [1e4eee5176c91b00e73cee90712a995668020a9c] Merge branch
> 'mhi-next' of git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git
> git bisect bad 1e4eee5176c91b00e73cee90712a995668020a9c
> # bad: [962bc2aae4f4295314d4a5f5c59a465f97f8b59a] Merge branch
> 'for-next' of
> git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-auxdisplay.git
> git bisect bad 962bc2aae4f4295314d4a5f5c59a465f97f8b59a
> # bad: [612fd001319aae2b514fc234939806cf3294dbba] Merge branch 'main' of
> git://git.infradead.org/users/willy/xarray.git
> git bisect bad 612fd001319aae2b514fc234939806cf3294dbba
> # bad: [f5175dd69428ab517c8d68e772c4d287b6570d8e] dt-bindings: nvmem:
> fixed-cell: increase bits start value to 31
> git bisect bad f5175dd69428ab517c8d68e772c4d287b6570d8e
> # bad: [8c94337ebbfb840944574f82df0cbe35930d8df8] dt-bindings: nvmem:
> rockchip,otp: Add compatible for RK3576
> git bisect bad 8c94337ebbfb840944574f82df0cbe35930d8df8
> # bad: [024e21343f3cbcde0343473fcaf094d2c19cc7bf] nvmem: rockchip-otp:
> Move read-offset into variant-data
> git bisect bad 024e21343f3cbcde0343473fcaf094d2c19cc7bf
> # bad: [3e081aa132bbefe31ac95dd6dfc8d787ffa83d0b] clk: rockchip: rk3576:
> define clk_otp_phy_g
> git bisect bad 3e081aa132bbefe31ac95dd6dfc8d787ffa83d0b
> # first bad commit: [3e081aa132bbefe31ac95dd6dfc8d787ffa83d0b] clk:
> rockchip: rk3576: define clk_otp_phy_g
> 
> On 09/03/25 6:08 pm, Venkat Rao Bagalkote wrote:
> > Greetings!!,
> > 
> > I see linux-next-20250307 fails to build on IBM Power9 and Power10
> > servers.
> > 
> > 
> > Errors:
> > 
> > In file included from ^[[01m^[[K<command-line>^[[m^[[K:

"In file included from <command-line>" seems a little suspicious.

> > ^[[01m^[[K./usr/include/cxl/features.h:11:10:^[[m^[[K
> > ^[[01;31m^[[Kfatal error: ^[[m^[[Kuuid/uuid.h: No such file or directory
> >    11 | #include ^[[01;31m^[[K<uuid/uuid.h>^[[m^[[K
> >       |          ^[[01;31m^[[K^~~~~~~~~~~~~^[[m^[[K
> > compilation terminated.
> > make[4]: *** [usr/include/Makefile:85:
> > usr/include/cxl/features.hdrtest] Error 1
> > make[3]: *** [scripts/Makefile.build:461: usr/include] Error 2
> > make[2]: *** [scripts/Makefile.build:461: usr] Error 2
> > make[2]: *** Waiting for unfinished jobs....
> > arch/powerpc/kernel/switch.o: warning: objtool: .text+0x4:
> > intra_function_call not a direct call
> > arch/powerpc/crypto/ghashp8-ppc.o: warning: objtool: .text+0x22c:
> > unannotated intra-function call
> > arch/powerpc/kvm/book3s_hv_rmhandlers.o: warning: objtool:
> > .text+0xe84: intra_function_call not a direct call
> > make[1]: *** [/home/linux_src/linux/Makefile:1997: .] Error 2
> > make: *** [Makefile:251: __sub-make] Error 2
> > 
> > Please add below tag, if you happen to fix this issue.
> > 
> > Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
> > 
> > 
> > Regards,
> > 
> > Venkat.

Regards,
Nicolas Frattaroli





