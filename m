Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D8F443C03
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Nov 2021 04:50:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HkXq82V2kz2yHM
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Nov 2021 14:50:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=libero.it header.i=@libero.it header.a=rsa-sha256 header.s=s2021 header.b=ci3bXMdb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=libero.it (client-ip=213.209.10.18; helo=libero.it;
 envelope-from=riccardo.mottola@libero.it; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=libero.it header.i=@libero.it header.a=rsa-sha256
 header.s=s2021 header.b=ci3bXMdb; dkim-atps=neutral
X-Greylist: delayed 288 seconds by postgrey-1.36 at boromir;
 Wed, 03 Nov 2021 09:52:53 AEDT
Received: from libero.it (smtp-18.italiaonline.it [213.209.10.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HkQCn4Yg4z2x9H
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Nov 2021 09:52:53 +1100 (AEDT)
Received: from [192.168.1.141] ([151.55.67.244])
 by smtp-18.iol.local with ESMTPA
 id i2XXmYuFxqopDi2XXm4DI9; Tue, 02 Nov 2021 23:45:59 +0100
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
 t=1635893159; bh=n25qprc1vBQw2XQ1xr6s6M2oqoLOM/DqwqlWHE3WbWU=;
 h=From;
 b=ci3bXMdbIWl8LLsSi3OlJcHVxJaFzCPn1KX3SKjS3rj9Bx3ICU1YHrc8TcoV5CalK
 8nfeml/2PHwT7uGtmdVPmXW7YUp7vguze2keMfzco+dLpGMUlNLAqxgCpwnsvUswXR
 gprphOSgxm4RdNl7nMndCnUhQ8tfN+cJIsJJQ0jLJRw+JbNBDRng8zXw33rypjYNa5
 qhL6rVqG6tFR1tc8VEwS1NV3D9c2fK5PJn5r0TXkrRDvgt7pMm1oYn4pYX7RymRQxb
 sthLT/bVwmw9iZa92KM6NGH7c8lG+eZWWGn9jhj4wKdFpixx8iglLxRisJ90y6wvMo
 lKrmAICgdYxqg==
X-CNFS-Analysis: v=2.4 cv=BPB2EHcG c=1 sm=1 tr=0 ts=6181bfa7 cx=a_exe
 a=oX9FqNkp6CM1qvU8Uz8rYA==:117 a=oX9FqNkp6CM1qvU8Uz8rYA==:17
 a=IkcTkHD0fZMA:10 a=k-Fpjo6v-nz4wkhcExAA:9 a=QEXdDO2ut3YA:10
Subject: Re: Fwd: Fwd: X stopped working with 5.14 on iBook
To: "Christopher M. Riedl" <cmr@bluescreens.de>,
 Finn Thain <fthain@linux-m68k.org>, "Christopher M. Riedl"
 <cmr@linux.ibm.com>
References: <CFFNC8MZ20HR.13XRVPWSKVLE0@wrwlf0000>
From: Riccardo Mottola <riccardo.mottola@libero.it>
Message-ID: <b58d306e-661f-760f-502a-23432b359762@libero.it>
Date: Tue, 2 Nov 2021 23:45:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101
 SeaMonkey/2.53.9.1
MIME-Version: 1.0
In-Reply-To: <CFFNC8MZ20HR.13XRVPWSKVLE0@wrwlf0000>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfNTb3Hv8e6QPs22aiGgn7143MVgpjUfdvTWSGtVrRvGLXvmGOwamFBD1lb3fJ+T4J1JLQ/NDI6ApJ/S/4E04OofUs49PYERV1CwKPS1LFyZfoJuU/LmG
 zZbVvsgYOECB2fLHCdPgU0OsQuMp7QvK7MyZR9BWZO6BQhsmDyA+Hs9Z3o3/M1/Ao/RUnJGfywj/Gm5QWSa+pwV7ttf2fhV/2vfZ/2WG5s0mgh5syuryZiL5
 au+lHHh8qwY7/wV0y8U1h/sQf+TiD6z0p4Lw5knfddnGPFFsDHHzkdCuoOlAesl0qb0aKRP4HbmCsRFrqyFbdGKuyu5OSx044Ozzcu+yZcjWyf2Nz0eyYjkv
 TyRCc2mh
X-Mailman-Approved-At: Wed, 03 Nov 2021 14:49:57 +1100
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
Cc: Stan Johnson <stanley.johnson.001@protonmail.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi All,


Christopher M. Riedl wrote:
> Stan also tested a PowerMac G3 system and found that the regression is
> not
> present there. Thus far, only PowerMac G4 systems are known to be
> affected
> (Stan's Cube and Riccardo's PowerBook).

I actually tested right now on an iBook G3 kernel 5.14.12-1 of 2021-14 
from Debian and X does not start on it anyway, with the same behaviour 
on the G4.
During the weekend I did test on an iMac G5 and it works.

I don't know how Stan tested - but at least for me issue seems to be 
both G3 and G4.

Riccardo
