Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F314C62DE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Feb 2022 07:22:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K6Vff4ysLz3bhB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Feb 2022 17:22:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=sackheads.org (client-ip=159.203.76.21;
 helo=chumdrop.sackheads.org; envelope-from=jimmie@sackheads.org;
 receiver=<UNKNOWN>)
X-Greylist: delayed 522 seconds by postgrey-1.36 at boromir;
 Fri, 25 Feb 2022 01:14:32 AEDT
Received: from chumdrop.sackheads.org (chumdrop.sackheads.org [159.203.76.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K4FK42prCz3089
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Feb 2022 01:14:30 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
 by chumdrop.sackheads.org (Postfix) with ESMTP id C5BC0156B10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 09:05:01 -0500 (EST)
Received: from chumdrop.sackheads.org ([127.0.0.1])
 by localhost (chumdrop.sackheads.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 33e0iNyXjOEo for <linuxppc-dev@lists.ozlabs.org>;
 Thu, 24 Feb 2022 09:05:01 -0500 (EST)
Received: from [10.0.1.4] (cpe-96-28-86-122.kya.res.rr.com [96.28.86.122])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: jimmie@sackheads.org)
 by chumdrop.sackheads.org (Postfix) with ESMTPSA id 8631C156B0F
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 09:05:01 -0500 (EST)
Message-ID: <eb7206b9-bd4b-d70f-68f5-f292a0a357f2@sackheads.org>
Date: Thu, 24 Feb 2022 09:05:00 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To: linuxppc-dev@lists.ozlabs.org
From: Jimmie Mayfield <jimmie@sackheads.org>
Subject: Question about update_persistent_clock() routine
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 28 Feb 2022 17:22:14 +1100
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

Hi,

I'm investigating a timekeeping problem on an old PPC-based embedded 
device and am curious about the update_persistent_clock() routine.   
This device runs a 3.10-era kernel but a similar (deprecated) function 
exists in the 5.16 kernels so I'll refer to the latter:

In arch/powerpc/kernel/time.c :: update_persistent_clock64() we have the 
following:

     rtc_time64_to_tm(now.tv_sec + 1 + timezone_offset, &tm);

I'm particularly curious about why a second is added to the value when 
building 'tm'.  This behavior appears to go back at least to the 2.6-era 
kernels.  Is it simply trying to account for the time spent in the 
kernel prior to updating the RTC?


Jimmie

