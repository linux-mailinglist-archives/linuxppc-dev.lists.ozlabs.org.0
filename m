Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 813CF23FEB0
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Aug 2020 16:16:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BPh431P0NzDqFJ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Aug 2020 00:16:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo4-p00-ob.smtp.rzone.de (client-ip=85.215.255.21;
 helo=mo4-p00-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=Qb7Eucg3; 
 dkim-atps=neutral
X-Greylist: delayed 170844 seconds by postgrey-1.36 at bilbo;
 Mon, 10 Aug 2020 00:12:48 AEST
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [85.215.255.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BPgzN12BYzDqRD
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Aug 2020 00:12:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1596982358;
 s=strato-dkim-0002; d=xenosoft.de;
 h=Date:Message-ID:Subject:From:To:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=TXByyANEUnSFKtbv3NN019NNZVUfcaivsI1R1Z7i94k=;
 b=Qb7Eucg3hK9llWlp63x4+fK6lZItiM9b5GsdLcPlg4jHkmNkLo9rUkVJqxFCGpzEjx
 DJOwZNLebMe4SP2LuaMmP5lTSj2BVgqh6cXnUEUasXiX3Mzz3dVxYqYE6Y4Od/tM4A9b
 UAs3TIKX4nI8VCvKwR9+mWrHfkoBsOZp9iuVRKxDDw2N0nKY1nQF+8JcUNCv+erpxx2v
 2AekY2CquxW1g16L8lYu64wuqJrd9S2iDrOD2hW4zjdyymQrERPSvYYb2Oww7O48dm2x
 5qMi9gQ94Woy4eNpptFvaUJ0YD7PsAKyORSPdPbo/5ui2yOJGcnNv3EyHo4jZnVZnEe+
 ixEA==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBJSrwuuqxvPhSI1Vi9hdbute3wuvmUTfEdg9AyQ=="
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2a02:8109:89c0:ebfc:15f9:f3ba:c3bc:6875]
 by smtp.strato.de (RZmta 46.10.5 AUTH)
 with ESMTPSA id 60686ew79ECZS9J
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Sun, 9 Aug 2020 16:12:35 +0200 (CEST)
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, aneesh.kumar@linux.ibm.com, 
 "R.T.Dickinson" <rtd2@xtra.co.nz>, Darren Stevens <darren@stevens-zone.net>,
 mad skateman <madskateman@gmail.com>, Olof Johansson <olof@lixom.net>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Subject: [PASEMI] Nemo board doesn't boot anymore after the commit
 "powerpc/book3s64/pkeys: Simplify pkey disable branch"
Message-ID: <8f4c1afc-89cf-749b-2b2d-4efa5ef3acff@xenosoft.de>
Date: Sun, 9 Aug 2020 16:12:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: de-DE
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

The Nemo board (A-EON AmigaOne X1000) [1] doesn't start with the latest 
Git kernel anymore after the commit "powerpc/book3s64/pkeys: Simplify 
pkey disable branch" [2].

I bisected today [3].

Result: powerpc/book3s64/pkeys: Simplify pkey disable branch 
(a4678d4b477c3d2901f101986ca01406f3b7eaea) [2] is the first bad commit.

Unfortunately I wasn't able to revert the first bad commit. The first 
bad commit depends on many other commits, which unfortunately I don't 
know. I tried to remove the modifications of the files from the first 
bad commit but without any success. There are just too many dependencies.

Additionally I reverted the commit "selftests/powerpc: Fix pkey syscall 
redefinitions" [4] and compiled a new kernel but without any success.

Could you please check the first bad commit?

Thanks,
Christian


[1] https://en.wikipedia.org/wiki/AmigaOne_X1000
[2] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=a4678d4b477c3d2901f101986ca01406f3b7eaea
[3] https://forum.hyperion-entertainment.com/viewtopic.php?p=51340#p51340
[4] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=a7aaa2f26bfd932a654706b19859e7adf802bee2
