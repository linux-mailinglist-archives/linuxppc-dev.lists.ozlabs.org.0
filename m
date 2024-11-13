Return-Path: <linuxppc-dev+bounces-3144-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C049C6A81
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2024 09:22:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XpGVv4ZSCz2yZ7;
	Wed, 13 Nov 2024 19:22:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=43.155.80.173
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731486167;
	cv=none; b=kPM6zybkKqTLxjzHtuCvPk5PpOaUWueEVizaO/ZG85OVisSuxk4HhubLghHdSId2vZIoCp/2oiBRgHSkDeMk8Ch+/Z7afNBFyytSeYXfefyix1qsKrcPN56DyXgCHkYkn/SwU6FPZCmizqX14+b3+Zo79T7T1ezIHzYZyxaDQHLGD/kUy5MdEIQEUB8wzgO32tqJ2/7ONPSUOHP14O69Rv0V0vY/ul9ryHWt0IexeZa2lfAe1nwnb8veBqHTqi3d++//tuYWGmSJkhHkLJKgaNIJnhHildceN9JiVbkOIMLBN8rhVpnkf4LMNZ1iPh7iQFlg/Wd5+Jk0W45MHx66oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731486167; c=relaxed/relaxed;
	bh=G/uyGjGxBW66UNs9mtfiCxx9X7fQYOPok+06w7ey2tw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BcrzOiXyeb9Srw/CsIPleUlD3cvCK9eUR6cRedIwKehBarl7KpSpNqes88Uc/IHOggD5tLNkV1V4buBnoB4k2k5oA1aq4ngXzhTC1V8XTU3g5nkTZ9S4JLrOL0L9Mh+zAx6O9tyZ90UZST21bJii3ffp8j3gL4NMqXN4Fz4z3TA9xI9fMSatav3jrJewt+YrqH/zmsE3wlovatvra62o/sBrfN/qe1STjFzMYSxS2eDEoBbRdNZ0UTp4vmy66rjMEs5X1nLD0tbz/q09/F7ybNn/PuyT8sqouPIYMtBUhlhP5o/x05zjLhWuNCtpxxK/n2cRzHMXjtyis9y5hEJOeg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=shingroup.cn; spf=pass (client-ip=43.155.80.173; helo=bg5.exmail.qq.com; envelope-from=luming.yu@shingroup.cn; receiver=lists.ozlabs.org) smtp.mailfrom=shingroup.cn
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=shingroup.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=shingroup.cn (client-ip=43.155.80.173; helo=bg5.exmail.qq.com; envelope-from=luming.yu@shingroup.cn; receiver=lists.ozlabs.org)
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.155.80.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XpGVs5ypKz2yXY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2024 19:22:42 +1100 (AEDT)
X-QQ-mid: bizesmtpsz6t1731486021t4397o8
X-QQ-Originating-IP: AoCBNTqGjiCgwOMShPwU/XfcQ+AXxg4rXlYGy1H+O7I=
Received: from HX09040029.powercore.com.cn ( [116.233.136.127])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 13 Nov 2024 16:20:18 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12408500961849753920
Date: Wed, 13 Nov 2024 16:19:56 +0800
From: Luming Yu <luming.yu@shingroup.cn>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
	luming.yu@gmail.com
Subject: Re: [PATCH v2 8/8] powerpc/entry: fix ppc syscall entry issues for
 common entry
Message-ID: <E6A78B539A22183F+ZzRhLPuA7m_YcuvV@HX09040029.powercore.com.cn>
References: <20241111031934.1579-2-luming.yu@shingroup.cn>
 <AD7BF1A62C0AD367+20241111031934.1579-16-luming.yu@shingroup.cn>
 <87y11nlijn.ffs@tglx>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87y11nlijn.ffs@tglx>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpsz:shingroup.cn:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: OFWsfmE1GYcuy2IuR7ksmSVzWzYgbVw2UCnlizslW2/chO8jj9MvaXHQ
	2g1E/kv9qmVLT+O/yGAjzuvSxV24Q6e9x2/jT4eIRDhUQWsiRGHOq6zzCt0vr8IEnxxk88H
	MEYwchXsvRQxJJtbjM9Bba4lmAz41xqeGpfxBTGrRM1ov1YuGfMktbHgej9LugkaQjmWoBl
	acbbTXkj6LU4fiw4tCHDPdc7ndik8u2gVkQH2B3IvMym0yHS7z72m/+6ewhGsr/VFFmso/P
	m1hoQ2heplen58LkNkcAo2/je7oMhXe05gjt0NqPx9PdxqhprHF+wl3Qbdo+cD9KVSxnb9S
	D7zXBKNOTRchs14H9LIrhxjUx/iZKwwKSXLy43v93YcH49Uou3yNh03Mq5j52QfIR7kStjK
	FLU6N64o4NnyDV7EOGALwY7emN/tFRwL3X1Uq8KAzVD//uTXxWK/36/yRkXD/eeXauv2+LB
	sDbcD101L4ENU8T7+aF+rQ3V26Qq3HwQmXnrfauXg4pZLybmCweoMMnCy5ScKB80PBOmGa/
	15GcvDOy9eatPWKTLCpp02/GBkaIcj0M0z5B+B+uqcT2ElbJ/TFFjxQiMjkSmPvU4R2sqN/
	kRN7na8w/S2k7Dj25TMi0BsQ2QgHcfGSP62SR2RkBppZ/WTo2zaAYNczL18n2CQzKSbyuBK
	ogUF10ohc1MPtwvPpdo/P/m82kCNxFBs6/+9RqOgvfRNmAmhWvygv25G4hUEERN/KBvExR1
	y8q6hBdzlTl/vPUAvI/HaDD6ZWH17ttW80YMHQyNeQNee5KGlaA2OxY/W9BNJSdUGHjSCkx
	4GJy2hgO5Ef66AncQSmJr8p0/NW76ZzGowtdkHdpOPIdxtTrCT7KuKFZDSRtvNSaKAmQ5Y3
	Bt1l9JGiM6T35ypt62SV6NJa3Eoh9regCHguvdNeTExTvKZhkw7v/xKYxrPqQpJQTIC23kn
	bKeI42ehZ72zPw8dztFoDSNJV
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Nov 13, 2024 at 08:06:04AM +0100, Thomas Gleixner wrote:
> On Mon, Nov 11 2024 at 11:19, Luming Yu wrote:
> > Due to the common layer and internal calls details are hidden from
> > the top level at the call side in ppc arch code, there are some
> > difficulties in preserving
> > all semantics implications of the original code in the patch. e.g  when
> > we got -1 returned
> > from syscall_enter_from_user_mode, without touching common code, we have
> > to do
> > our own inference to recover the reasonable route to return, in order to
> > have correct errno
> > and syscall work behaviors,that are tested in seccomp_bpf 98 test
> > cases.
> 
> This indicates that your conversion to the common code is broken to
> begin with. Which is not surprising given the amount of issues I found
> already.
> 
> You need to sit down an come up with a proper conversion design and not
> just randomly replace things and then hack around the fallout later on.
> 
> If that requires changes to the core code, then they have to be designed
> up front and implemented in a way which does not affect existing users.
> 
> Thanks,
> 
>         tglx
Thanks for your time and the review comments. It is helpful.
The 3rd ver of the patch set should be able to address all these issues.
Going through v0 to v2, I think I've truely understood how came ppc64 that is stuck
in the halfway to be able to enjoy least code duplication while having fully function on top
of common entry code for so many key features. 
when the v1 is out, it is already too late to call back and the v2 was reluctantly out with
a random fix instead of clean conversion as you concluded just for making the hack working
as it was.  : -( 
> 
> 
> 


