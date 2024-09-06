Return-Path: <linuxppc-dev+bounces-1104-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C8096F3B2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Sep 2024 13:55:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0ZRj6jfvz305v;
	Fri,  6 Sep 2024 21:55:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725623729;
	cv=none; b=Zbmn1OIkMi4A33k3q5aAPah2fpQGj/toTNNNHg3eaW3iB8fe4mT54Y53c/0gHyoPxPnMedqPBjjDNGOxdEygYLrRC2lrp/YwztFJh7dkZZoqME7um+o4nS6FRlOUIaCE290/RzSTGQJCqs0GYPUK6i7qdt7R9WeAsP5djO5yzKsTCgMrmBhcySEZWKqg699ceLl2a/uTJehD+VZP2IiQXVEkynVwyf3n4wiADaurLYi/Ef4HAhDyWK8KCGa979q4GqFw5xYVonreQ5WtYuZViuP887s+niqvGtctxLi/92yaQX3mfUfL61/k8jtIqYvHiaSfHNBfqo4QtL1Zd3kX5g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725623729; c=relaxed/relaxed;
	bh=obi7msVGRlzoEz1W/jzDgo3xBNxggqpVSzexlh/yX3U=;
	h=DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type; b=hfuRc01IpS5/LV4yaN7Q2k7PuT1tGB7S/Vz7wHztwonVDl4jnwHxeir7knmoZaBlCBrEMqzRpjZMTAxujJEdBXF+bDbckSjsfZBXSCmepFCYnt7K/Z1ypHpD7x7etdYilmmTUP0L08nwu6xHAWs/fMoLxgGPx/CjZDGTN/NAx7YZlLOZuZmtUbUE+5qAG3SB2jRgqqnarOO2lwD+AsSJs5H9t0qQCEPhEevqlZawUpCxdELP0VnBkWR1g2cglYeFwW3A7ltfvhSzFcHMG0mENONvNmgoEYqqJVnKnvLmnwpUaJ1MeiSo3mkVDT0NT/Nq4ta6NcJNq1J7+MwKITMUZg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=VP/NAXLL; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=VP/NAXLL;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0ZRj4bMPz304N
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Sep 2024 21:55:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1725623729;
	bh=obi7msVGRlzoEz1W/jzDgo3xBNxggqpVSzexlh/yX3U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=VP/NAXLL0mtBCAWdRfKmUH59hbI0XQ5671PkHvQLfDTtWGcoeBpUZkW8e9dSfJQyy
	 RjvV4yICu1kdthGqFFfhhw1omASPsfivaHmVS4m5JY3l8z9Rx6fpZxb25MOjfwgvyS
	 dP8YM5ZBew5Bz8egnOGqV4fczan7fXvjczp2djiTvuCZhcIHXYnIywqAq0tPJqGBE6
	 XEw9cT+krVH+3inXLYUKaxgNkIgQaQkFB53LAMSAXXeN1Cgi1pXKENN4Ldz0hRQpkG
	 iEnB8SzRn8mtuAG2JCqzMS5r/hzO7x6y9xc2vnvZU+HEPlP9GV7hzHCI+M78dn/qSq
	 tHrX6yAQqM/WQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X0ZRj3N1Vz4wnw;
	Fri,  6 Sep 2024 21:55:29 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Abhishek Dubey <adubey@linux.ibm.com>
Cc: naveen@kernel.org, hbathini@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, mhiramat@kernel.org, bpf@vger.kernel.org
In-Reply-To: <20240830113131.7597-1-adubey@linux.ibm.com>
References: <20240830113131.7597-1-adubey@linux.ibm.com>
Subject: Re: [PATCH v4 RESEND] powerpc: Replace kretprobe code with rethook on powerpc
Message-Id: <172562357215.467568.2172858907419105155.b4-ty@ellerman.id.au>
Date: Fri, 06 Sep 2024 21:52:52 +1000
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On Fri, 30 Aug 2024 07:31:31 -0400, Abhishek Dubey wrote:
> This is an adaptation of commit f3a112c0c40d ("x86,rethook,kprobes:
> Replace kretprobe with rethook on x86") to powerpc.
> 
> Rethook follows the existing kretprobe implementation, but separates
> it from kprobes so that it can be used by fprobe (ftrace-based
> function entry/exit probes). As such, this patch also enables fprobe
> to work on powerpc. The only other change compared to the existing
> kretprobe implementation is doing the return address fixup in
> arch_rethook_fixup_return().
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc: Replace kretprobe code with rethook on powerpc
      https://git.kernel.org/powerpc/c/19f1bc3fb55452739dd3d56cfd06c29ecdbe3e9f

cheers

