Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5072B8898BD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 10:48:55 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=VOh6MWc0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V37Rn0flRz3dSV
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 20:48:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=VOh6MWc0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.113; helo=out30-113.freemail.mail.aliyun.com; envelope-from=yaoma@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-113.freemail.mail.aliyun.com (out30-113.freemail.mail.aliyun.com [115.124.30.113])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V37R125xlz2xqq
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Mar 2024 20:48:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1711360085; h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type;
	bh=QmV+g4GmhsxbZGKeBGO2QlNGUE+VuS1qiEGgbu8EpKw=;
	b=VOh6MWc0hBgULdgEa8EUijWA92CqIjYcGrrFAmC88UMqwoHbjLwAhFChIhErqVEtGuVaRdw4ZCNfH+jjQ77m0iQWTrYe1++onhtk0t8wpJ5bTANk2n1HmCVr3DjoAvTTEq0sztso/61DJtatEppxUUkdjNGZX+/al2BI+jFXQ3w=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R141e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045170;MF=yaoma@linux.alibaba.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---0W3EQlKh_1711360081;
Received: from 30.178.67.255(mailfrom:yaoma@linux.alibaba.com fp:SMTPD_---0W3EQlKh_1711360081)
          by smtp.aliyun-inc.com;
          Mon, 25 Mar 2024 17:48:04 +0800
Message-ID: <6109a3e3-ca88-4a4d-86c5-c4eb0d7f6f9c@linux.alibaba.com>
Date: Mon, 25 Mar 2024 17:47:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Bitao Hu <yaoma@linux.alibaba.com>
Subject: Re: [PATCHv12 4/4] watchdog/softlockup: report the most frequent
 interrupts
To: Thomas Gleixner <tglx@linutronix.de>, dianders@chromium.org,
 liusong@linux.alibaba.com, akpm@linux-foundation.org, pmladek@suse.com,
 kernelfans@gmail.com, deller@gmx.de, npiggin@gmail.com,
 tsbogend@alpha.franken.de, James.Bottomley@HansenPartnership.com,
 jan.kiszka@siemens.com
References: <20240306125208.71803-1-yaoma@linux.alibaba.com>
 <20240306125208.71803-5-yaoma@linux.alibaba.com> <87zfuofzld.ffs@tglx>
Content-Language: en-US
In-Reply-To: <87zfuofzld.ffs@tglx>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: yaoma@linux.alibaba.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi, Thomas

On 2024/3/24 04:43, Thomas Gleixner wrote:
> On Wed, Mar 06 2024 at 20:52, Bitao Hu wrote:
>> +	if (__this_cpu_read(snapshot_taken)) {
>> +		for_each_active_irq(i) {
>> +			count = kstat_get_irq_since_snapshot(i);
>> +			tabulate_irq_count(irq_counts_sorted, i, count, NUM_HARDIRQ_REPORT);
>> +		}
>> +
>> +		/*
>> +		 * We do not want the "watchdog: " prefix on every line,
>> +		 * hence we use "printk" instead of "pr_crit".
>> +		 */
> 
> You are not providing any justification why the prefix is not
> wanted. Just saying 'We do not want' does not cut it and who is 'We'. I
> certainly not.
> 
> I really disagree because the prefixes are very useful for searching log
> files. So not having it makes it harder to filter out for no reason.
> 


Regarding the use of printk() instead of pr_crit(), I have had a
discussion with Liu Song and Douglas in PATCHv1:
https://lore.kernel.org/all/CAD=FV=WEEQeKX=ec3Gr-8CKs2K0MaWN3V0-0yOsuret0qcB_AA@mail.gmail.com/

Please allow me to elaborate on my reasoning. The purpose of the
report_cpu_status() function I implemented is similar to that of
print_modules(), show_regs(), and dump_stack(). These functions are
designed to assist in analyzing the causes of a soft lockup, rather
than to report that a soft lockup has occurred. Therefore, I think
that adding the "watchdog: " prefix to every line is redundant and
not concise. Besides, the existing pr_emerg() in the watchdog.c file
is already sufficient for searching useful information in the logs.
The information I added, along with the call tree and other data, is
located near the line with the "watchdog: " prefix.

Are the two reasons I've provided reasonable?

Best Regards,

	Bitao Hu
