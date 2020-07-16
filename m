Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 482D7222ED7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 01:15:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B79843ZTXzDrDn
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 09:15:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::832;
 helo=mail-qt1-x832.google.com; envelope-from=danielhb413@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=STBnq3ni; dkim-atps=neutral
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B79625JvrzDq9T
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jul 2020 09:13:11 +1000 (AEST)
Received: by mail-qt1-x832.google.com with SMTP id 6so6346164qtt.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 16:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:subject:to:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=wZS/t2Mj0TGsuGPTN8DU449TKfPVJLD4EGITfzmiAIY=;
 b=STBnq3ni6/bBe/uZ+0mJgBZNnWFLngdH3C+uopRvxRihT2yTkSPatS0Lrt0Q9G+peY
 83of6ZmHPqQCy7stkOzFtGRRfpQxhV6DCgV/+Ux0JwXZtW/oQV7EeY7j58pN3BRHWTwZ
 kzKzRa7pk0lcPT97p5NXyQGjzdnu+pEeltCLMvaOnIqUP2/tgC8M9oP7PeFntlugE/yA
 a7ndm/sIL023NXZVtzUDGWfJtRLxIWFbyWKuBAZMtV1hlH36ZrEjcePOqlj2Y7RsjmXl
 rCJNekDWRUi1C7SJMS8XZj1Ye5rLsmbsFEzNRju66AUWw/L1F/D03vWwQwJHm27KIz7F
 pYvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=wZS/t2Mj0TGsuGPTN8DU449TKfPVJLD4EGITfzmiAIY=;
 b=PcBloFcCRjclWXD68lV815DanzRqI61mx5wFRRVyFNbDHCA4kk2pdE3xZTNUOwJgW+
 ZSc0Qmii13YjBoi00v00HJVDXoTLW9GAw2HzXmnu8kdjlN1Aaau8uaS6c88HB6AIoMT9
 FoLUu4byTP1T1kOUQ7IHpIJ9HqgBqhr5Q/p8EvXzelgGn5wvYcI2XQiYEoBSSs1oWtgK
 ygkKRW5sMwabmCTJUraO8E08Q/3IGqdr6Lb+Cu/x2mkWqSqArpBGVfuyhyN0SP7GZfSF
 iU3tuKA/6hB4XqAdLSDBOlHBlfwDkrrw/ZyleI0ZBgMhizmQopbF0qmExWYv41NIUq28
 xn6A==
X-Gm-Message-State: AOAM53350Ecb+Gl1361Ibf4olHccW/JmBrJbT00yFgDSBoG7DqkyIyER
 s/xJ55Qnd7cZNAlernGMmFh65bOw
X-Google-Smtp-Source: ABdhPJwsFlJ+VzRJb4narIXG6ce3qOl+OVq2kXfVBVNWRqXEQFVdi2tO35SInge7NbavdDUG+zYtNA==
X-Received: by 2002:ac8:514d:: with SMTP id h13mr7779006qtn.223.1594941185147; 
 Thu, 16 Jul 2020 16:13:05 -0700 (PDT)
Received: from ?IPv6:2804:431:c7c6:9447:1f8b:580e:61d9:b1a4?
 ([2804:431:c7c6:9447:1f8b:580e:61d9:b1a4])
 by smtp.gmail.com with ESMTPSA id p80sm8700442qke.19.2020.07.16.16.13.04
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jul 2020 16:13:04 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Question about NUMA distance calculation in powerpc/mm/numa.c
To: linuxppc-dev@lists.ozlabs.org
Message-ID: <e5c3b1f1-d6ac-50d5-95f5-3c6e830a078e@gmail.com>
Date: Thu, 16 Jul 2020 20:13:03 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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


I didn't find an explanation about the 'double the distance' logic in
'git log' or anywhere in the kernel docs:


(arch/powerpc/mm/numa.c, __node_distance()):

for (i = 0; i < distance_ref_points_depth; i++) {
	if (distance_lookup_table[a][i] == distance_lookup_table[b][i])
		break;

	/* Double the distance for each NUMA level */
	distance *= 2;
}

For reference, the commit that added it:


commit 41eab6f88f24124df89e38067b3766b7bef06ddb
Author: Anton Blanchard <anton@samba.org>
Date:   Sun May 16 20:22:31 2010 +0000

     powerpc/numa: Use form 1 affinity to setup node distance
  

Is there a technical reason for the distance being calculated as the double
for each NUMA level?

The reason I'm asking is because of the QEMU/Libvirt capability to define NUMA
node distances in the VMs. For x86, an user is capable of setting any distance
values to the NUMA topology due to how ACPI SLIT works.

The user, of course, wants the pseries guest to behave the same way. The best
we can do for now is document why this will not happen. I'll document the
limitations imposed by the design itself (how ibm,associativity-reference-points
is capped to MAX_DISTANCE_REF_POINTS and so on). I also would like to document
that the pseries kernel will double the distance for each NUMA level, and for
that it would be nice to provide an actual reason for that to happen, if
there is any.


Thanks,


Daniel

