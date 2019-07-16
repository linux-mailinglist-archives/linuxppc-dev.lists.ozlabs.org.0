Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED3A6B060
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2019 22:23:51 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45pBgS3q4xzDqfv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jul 2019 06:23:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmx.de
 (client-ip=212.227.15.15; helo=mout.gmx.net; envelope-from=deller@gmx.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=gmx.de
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.b="CC7D8+w3"; 
 dkim-atps=neutral
X-Greylist: delayed 333 seconds by postgrey-1.36 at bilbo;
 Wed, 17 Jul 2019 06:19:58 AEST
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45pBb21n89zDqdT
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Jul 2019 06:19:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1563308387;
 bh=7VY8YH9jMovACrIdrhvISc8JByEG9+fowfzeNmRgOfo=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=CC7D8+w3oEQhqlEB0feOnxYqEmP5BN4s0rFJWV0d5mAR1HOU+IX1dvIEN3wVpQVH6
 5xLcUQib0tq7vres8G8s33cq/omG2QD7eDSc2287LuGiE3fDfXWlNftPxuetidHlOT
 bm+KffH+62ipRaCJhHiGV+6ZFKLOVwwwJSJvIO3I=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.163.176]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MkHMZ-1iC4Dg3Ysb-00kbu2; Tue, 16
 Jul 2019 22:14:01 +0200
Subject: Re: [PATCH 1/2] arch: mark syscall number 435 reserved for clone3
To: Christian Brauner <christian@brauner.io>,
 Sven Schnelle <svens@stackframe.org>
References: <20190714192205.27190-1-christian@brauner.io>
 <20190714192205.27190-2-christian@brauner.io>
 <e14eb2f9-43cb-0b9d-dec4-b7e7dcd62091@de.ibm.com>
 <20190716130631.tohj4ub54md25dys@brauner.io>
 <20190716185310.GA12537@t470p.stackframe.org>
 <20190716185554.gwpppirvmxgvnkgb@brauner.io>
From: Helge Deller <deller@gmx.de>
Message-ID: <6d47935e-218c-3eb9-7617-14ce199f5958@gmx.de>
Date: Tue, 16 Jul 2019 22:13:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190716185554.gwpppirvmxgvnkgb@brauner.io>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2cW2yydYOFZ0K7SnlkSJRJZL6gbN19kSgKbyZFedY35qUSBwLwc
 KFwmZoyiIfN7b/p+DVlTRhgAyhZ7VdGpXdQVEnj51qjaJkW5gaAkDBU8LIwUGMGXiMX9maV
 GUvBYvRjVz9REkKhNe849boNzNZvi79Q2Q2BRRVgSNGmQF+a0pftaHPMxwZ9+pCndGXBx6X
 LsecZ2wqaeXWgof6fVzqg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:/DJK3PW8CLw=:5nx/FB6sRP6fQarrJUC6GV
 PxhMJEX6IkCTNL1RO2nJxmB6nUE0bw4XOBD0/HRU1gvr71qQPlRqys64VkmjEAu0Ssk913qxL
 DEpF7nF+huRoTZJd2BeieYJTeWxa2F66bD28J4TIA8vTH+youMofl2mG8gqITZrogRspt6j59
 2TkSdnBnPxDlsigahg2otbRQHUrXmtnYNloeDeTb5mD9FuzAD6cekX0nRCE26flxevcvwLYWS
 TIYZAtlU6P4uVt9Rg51VOfb6pUxwoFjsMqp8WnB6xosUuu/jk6W5k80y2O9XPdO4AXB8hKTHO
 7qDNRSS4g2Cu2tSkgSy6AGDcPVNgvSJ5s9f6fiva44IIKFLHc5SeYBbKPGUeHl7ILk6OYW4/x
 XV9ZHPrUD95MuIngLYLyGuzbur6uC2EsOLuePPju73Y2CpoqRGj/viNAoxcX9X3R5RNBDpJ7N
 aSy5EPSYZ2NXP6c+5jYL2EImFsB7Pq6x3qFu99h1ZoM5ad/i4FRRoCkHAug4K10RBV3U1tAxi
 Uj6T9tA0LR7wpSFDrQhou3GlxhExbo9hOowuyEEbRFVSXINshvYGqvFuVYPo+tyiQphgdTZeS
 vdBqQqHaLE54in4Neti0sL1vy738watMR3JGp8F4m16jLM+VZ6YBlZDcQ+FSYhh5ij063UlGT
 40zYzGoWPo+AYLs0Q0vgSIpeVFAckxQEhYOEKjVUusiqb/W06ZqpH7uhrTDVs4LuvMEzE6JHG
 /ic5GyHKpJI/5BMTP5ZArgJJQJkmcPVthazvI4gqHS6Lox821uxT2M9NHHKkx5X46jZE5OTfJ
 IvAGjIGLKDsu7Qa0zQCbe9Exj97Sn7gTb0U2WlrSie2tNAvl659L7+tdmVTe5OmUlFTRtnLDB
 78Lp99S0Wxwixf595Zai25kZ3RDauma0OPFhy4Ok2oItLhwtxyIDDMIlP/U9I4iQJY0TEEnrk
 4b0zQhw5W+6IZb3QBkN1uTQ4F3iDGbyO+8JSP4PzQ5PROiVA2yYSqM/2HIfHuUWptC4EUlv9d
 2p/+xZwZpCqA1Jy+PDJ1ofyw4US4ZRN3R//ZxJwSejMuHbwvBFGGJtSG+QLuPtcIPbArMhAnA
 Fr88w3UB0yZISk=
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org, arnd@arndb.de,
 linux-sh@vger.kernel.org, Heiko Carstens <heiko.carstens@de.ibm.com>,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 linux-m68k@lists.linux-m68k.org, linux-alpha@vger.kernel.org,
 sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Vasily Gorbik <gor@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 16.07.19 20:55, Christian Brauner wrote:
> On Tue, Jul 16, 2019 at 08:53:10PM +0200, Sven Schnelle wrote:
>> Hi,
>>
>> [Adding Helge to CC list]
>>
>> On Tue, Jul 16, 2019 at 03:06:33PM +0200, Christian Brauner wrote:
>>> On Mon, Jul 15, 2019 at 03:56:04PM +0200, Christian Borntraeger wrote:
>>>> I think Vasily already has a clone3 patch for s390x with 435.
>>>
>>> A quick follow-up on this. Helge and Michael have asked whether there
>>> are any tests for clone3. Yes, there will be and I try to have them
>>> ready by the end of the this or next week for review. In the meantime =
I
>>> hope the following minimalistic test program that just verifies very
>>> very basic functionality (It's not pretty.) will help you test:
>>> [..]
>>
>> On PA-RISC this seems to work fine with Helge's patch to wire up the
>> clone3 syscall.
>
> [...]
> In any case, I saw Helge's patch and I think I might've missed to add an
> Acked-by but feel free to add it.

Thanks!
I've added the patch to the parisc-linux for-next tree.

Helge
