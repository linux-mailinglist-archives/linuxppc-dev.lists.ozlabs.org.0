Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D48086BAA1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Feb 2024 23:17:15 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=tuxayo.net header.i=@tuxayo.net header.a=rsa-sha256 header.s=tuxayo header.b=DGHDY4XR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TlTHD5LNmz3vX2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 09:17:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=tuxayo.net header.i=@tuxayo.net header.a=rsa-sha256 header.s=tuxayo header.b=DGHDY4XR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=tuxayo.net (client-ip=37.187.101.17; helo=ub3.linuxw.info; envelope-from=victor@tuxayo.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 564 seconds by postgrey-1.37 at boromir; Wed, 28 Feb 2024 16:33:23 AEDT
Received: from ub3.linuxw.info (ub3.linuxw.info [37.187.101.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tl30z3f9nz3bnL
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Feb 2024 16:33:23 +1100 (AEDT)
Received: from [192.168.0.17] (176.170.169.85.rev.sfr.net [85.169.170.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by ub3.linuxw.info (Postfix) with ESMTPSA id A6ED380C66;
	Wed, 28 Feb 2024 06:37:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tuxayo.net; s=tuxayo;
	t=1709098635; bh=uHE97/j12wyth4skm1HM/hRMXlTxyhxAMqjOXFcKPE8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=DGHDY4XRxG0sDAy5An3iqGiAM4aN2HjHEmRxH6RikRaAYQi/6b4vaKUbaydOHJ0NR
	 wuddzvp9qdvwNBp5bjAa3uc9kSCKikX/fbPHfcWwypEJZ6IoSK/l+56LK5hdhV6xMc
	 egz5qA6LSdHeIKmLtdenh2Q5dgctBg0ffDhHahuc=
Message-ID: <38a3f844-47b7-469a-821e-e0c8df40a7d8@tuxayo.net>
Date: Wed, 28 Feb 2024 06:23:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Boot failure with ppc64 port on iMacs G5
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
References: <fc93d03b-581d-40cd-8ab1-762a9ee2c20c@tuxayo.net>
 <42e9a15f6733dd48c64cbceeb3ad27349ca8c3e4.camel@physik.fu-berlin.de>
Content-Language: en-US-large
From: tuxayo <victor@tuxayo.net>
Autocrypt: addr=victor@tuxayo.net; keydata=
 xjMEXswFyBYJKwYBBAHaRw8BAQdAH9lUyHT7PtHU5V2WmRQoXZ3dEnLu7EnvemQTFi9X4CHN
 KlZpY3RvciBHcm91c3NldC90dXhheW8gPHZpY3RvckB0dXhheW8ubmV0PsKWBBMWCAA+FiEE
 U/OiUyG3GBQQo7XwAUCso7fYcLsFAl7MBcgCGwMFCQlmAYAFCwkIBwIGFQoJCAsCBBYCAwEC
 HgECF4AACgkQAUCso7fYcLueywEAopl5guOfAStDU3ZmsFRcF5x5ns3GJPGps8WmNuZBbcsB
 AOrgXGJWZ8ZOQzlGPU6sALUC+5AUseDwCTUp+b0csn4MzjgEXswFyBIKKwYBBAGXVQEFAQEH
 QMG1lHXrCFsoJslCJIzd7A42/UrdgUH3QlS3aRTluNMxAwEIB8J+BBgWCAAmFiEEU/OiUyG3
 GBQQo7XwAUCso7fYcLsFAl7MBcgCGwwFCQlmAYAACgkQAUCso7fYcLtWaQD+Jlgncp/iZ+yO
 0acR5QZELz/NS+BE3XU9Qg4MnfgBqFsA+wTaEI5Sb8Zn+0gx9YiLfhF7MkqFza2f0uthMJ0M EV8N
In-Reply-To: <42e9a15f6733dd48c64cbceeb3ad27349ca8c3e4.camel@physik.fu-berlin.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 29 Feb 2024 09:16:32 +1100
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
Cc: debian-powerpc@lists.debian.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Claudia Neumann <dr.claudia.neumann@gmx.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 24-02-20 10:16, John Paul Adrian Glaubitz wrote:
> There seems to be a regression in the kernel which affects PowerPC 970 machines,
> i.e. PowerMac G5 CPUs. The issue needs to be bisected and reported upstream.
> 
> If you have the time, I would really appreciate if you could test the various
> snapshots and let me know which kernel is the first to not work. I expect that
> the breakage occurred somewhere around kernel 6.3 or so.

No problem, I'm going there every week and can do as much testing as 
necessary even if it takes months. We got a donation of a standard PC so 
we have now one publicly usable PC at the library.
So I can take my time to try to make something out of the iMacs.

Results:
- 2023-06-18: ok
   - running strings on iso's vmlinuz yields 6.3.7-1 (2023-06-12)
- 2023-11-16: fail
   - 6.5.10-1 (2023-11-03)

As expected, the regression happened during the big gap between 
snapshots >_<

Anything more I can test?
(cross compiling old kernels is unfortunately too much over my head)

It's weird that it seems the regression is about booting the iso. 
Otherwise, net installs from old iso like what Claudia did wouldn't work 
after rebooting after install.

Cheers,

-- 
tuxayo

