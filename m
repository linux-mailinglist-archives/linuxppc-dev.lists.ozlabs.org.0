Return-Path: <linuxppc-dev+bounces-1367-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCAE0978CC3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Sep 2024 04:24:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X5FNx5KcNz2y66;
	Sat, 14 Sep 2024 12:24:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=114.132.62.65
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726280657;
	cv=none; b=oI+L3I0gN69JoVy6+F6GdJTqoSDtR7DUVZvbaLh2/CASxxaztum/YTz2IwYT++uFy4UexySm93Zr2/FXCwHJA0oxCt7xMVh5qKwtrb009JZqUsScLRQ5pZ4L69Oxo91O6txQH/AN91LqjuImDPzrI3L/h9OhAmQS/cYS/u/4J6vZA3vmuTdZ54xh/1yI+BPATjZD4mNLTFLGQJcSWH/nyDg9vIcHW9xjlLJ6Q2rqz7qpruWdc3xEPOeqXCsbq8yeKuRwTt7skABksTjNtuLVx+k3ikbg3HtB5piQ/O0meNAGhJxGqgCJEIKqZtOmokd/Z2qarLvuFWWKZNe7f1QZdA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726280657; c=relaxed/relaxed;
	bh=4rXaDdI3e3gQsuUIPBBn1q0zN6WJwgQ7NKlxHU38evM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ceahD6YCnPgxLLRCyt6UScwAU8XB6cepG+igTeGLWZ+ej8I3WP6jOoY+J2RFfB0isbismBejrWel1YcKsn0m+0zjMFmOsMC5fsNTytvW89dZabXg7xIb1bhpmLiwzwmqtljvUvqG1roRmVIwRw7ZT39sP2jThiQnhhca9RQRN8owxSKI1tUS/WYkHoXfVURbN7ESvTwsi1VR0rM5lcwlyosWZqqLYg0msyIr7QQ9SZDKwYbZj9k3KNlkT6KKM/Md/JfXWpoHkkut0JhwBYvzt8kopkFIgtwUTv9sf7BVDHP6eCozR9EDyc+Z7O7EqlPUc58xaieEI1DKBxyKHIOvdw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=shingroup.cn; spf=pass (client-ip=114.132.62.65; helo=bg1.exmail.qq.com; envelope-from=luming.yu@shingroup.cn; receiver=lists.ozlabs.org) smtp.mailfrom=shingroup.cn
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=shingroup.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=shingroup.cn (client-ip=114.132.62.65; helo=bg1.exmail.qq.com; envelope-from=luming.yu@shingroup.cn; receiver=lists.ozlabs.org)
X-Greylist: delayed 67423 seconds by postgrey-1.37 at boromir; Sat, 14 Sep 2024 12:24:15 AEST
Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.62.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X5FNv72YFz2xnX
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Sep 2024 12:24:15 +1000 (AEST)
X-QQ-mid: bizesmtpsz4t1726280583t45kfja
X-QQ-Originating-IP: zt9s5hnMP9ASfBOErfW6YV8nnU/KKrV7riW77zoyeqY=
Received: from HX09040029.powercore.com.cn ( [180.171.104.254])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 14 Sep 2024 10:23:00 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2754753639437398407
Date: Sat, 14 Sep 2024 10:22:34 +0800
From: Luming Yu <luming.yu@shingroup.cn>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	mpe@ellerman.id.au, npiggin@gmail.com, jialong.yang@shingroup.cn,
	luming.yu@gmail.com
Subject: Re: [PATCH 1/2] powerpc/entry: convert to common and generic entry
Message-ID: <9B5E7C0A7C4BFBF0+ZuTzanfk7BcYoFas@HX09040029.powercore.com.cn>
References: <B4ABABEA5F13B86A+20240912082500.1469-1-luming.yu@shingroup.cn>
 <fc509bcd-5ca0-4dc2-962e-766a01cbe4fb@csgroup.eu>
 <153FD6B5CE4F97D9+ZuOYDQ-iHIIwJjbh@HX09040029.powercore.com.cn>
 <95ced963-b584-4ccf-ba34-8f2ba99172f4@csgroup.eu>
 <0332BAE1905768B6+ZuPsBvgv0nwmFAjW@HX09040029.powercore.com.cn>
 <854eef54-4779-4233-a958-0c98ae5fcb7e@csgroup.eu>
 <F81D1486B7B82141+ZuQp4YQkAA2cB9Rw@HX09040029.powercore.com.cn>
 <81200b50-eaec-4cfd-9121-f661f3065572@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <81200b50-eaec-4cfd-9121-f661f3065572@csgroup.eu>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpsz:shingroup.cn:qybglogicsvrgz:qybglogicsvrgz8a-1

On Fri, Sep 13, 2024 at 02:15:40PM +0200, Christophe Leroy wrote:
> 
> 
> Le 13/09/2024 à 14:02, Luming Yu a écrit :
> 
> > > ...
> > > nothing happens after that.
> > reproduced with ppc64_defconfig
> > [    0.818972][    T1] Run /init as init process
> > [    5.851684][  T240] request_module: modprobe binfmt-4c46 cannot be processed, kmod busy with 50 threads for more than 5 seconds now
> > [    5.851742][  T240] kworker/u33:18 (240) used greatest stack depth: 13584 bytes left
> > [    5.860081][  T232] kworker/u33:16 (232) used greatest stack depth: 13072 bytes left
> > [    5.863145][  T210] kworker/u35:13 (210) used greatest stack depth: 12928 bytes left
> > [    5.865000][    T1] Failed to execute /init (error -8)
> > [    5.868897][    T1] Run /sbin/init as init process
> > [   10.891673][  T315] request_module: modprobe binfmt-4c46 cannot be processed, kmod busy with 50 threads for more than 5 seconds now
> > [   10.894036][    T1] Starting init: /sbin/init exists but couldn't execute it (error -8)
> > [   10.901455][    T1] Run /etc/init as init process
> > [   10.903154][    T1] Run /bin/init as init process
> > [   10.904747][    T1] Run /bin/sh as init process
> > [   15.931679][  T367] request_module: modprobe binfmt-4c46 cannot be processed, kmod busy with 50 threads for more than 5 seconds now
> > [   15.934689][    T1] Starting init: /bin/sh exists but couldn't execute it (error -8)
> 
> That's something different, this is because you built a big-endian kernel
> and you are trying to run a little-endian userspace.
okay
> 
> Does it work with ppc64le_defconfig ?
make ppc64le_defconfig

yes, it builds && boots just fine.
the host is a p8 powernv system , the qemu command line is as below:
qemu-system-ppc64 -m 64g -smp 16,cores=4,threads=4 --enable-kvm  -nographic -net nic -net tap,ifname=tap0,script=/etc/qemu-ifup-nat,downscript=/etc/qemu-ifdown-nat  Downloads/Fedora-Cloud-Base-38-1.6.ppc64le.qcow2

I will try other test configures as well.
> 
> On my side there is absolutely nothing happening after the last line, the
> screen remains steady.
> 
> 
> Christophe
> 


