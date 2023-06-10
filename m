Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D5372AE94
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Jun 2023 22:14:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qdq0c3P58z3f17
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Jun 2023 06:14:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Bd6rcV9N;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=bgPUpEic;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Bd6rcV9N;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=bgPUpEic;
	dkim-atps=neutral
X-Greylist: delayed 198 seconds by postgrey-1.36 at boromir; Sun, 11 Jun 2023 06:13:20 AEST
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qdpzh4l1xz3dxT
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Jun 2023 06:13:20 +1000 (AEST)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1686427997;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2FyW3Bj3MP4r2QbMriRspWC1T3TG2cIZbpm8o1sYXRk=;
	b=Bd6rcV9NAKZ2jF9T8IY/r60E4T8w90YHhU5xFpw/hpWHfXb8L6JiuDXY0t79Yll+2GT6qE
	xrQyfEHRFmUxuDwx1/hyEMammkYISdlkOp8umKeLO+o4AnucWOKnN3HM0OxQQL/XA0ywIy
	jHqvlI6q6CItsjeO85N9m0vwdlI0qw4BBxATVqzRnrzmnuXkZGICP3+ltYVrg+XNfQ8PH1
	ZntGRksKEHGrc3g3thOpY0E4eqXRzpz0bQI1NqI/3iDCzmd14sewUC7kzvRe7xLNc7k3EH
	LI7pUFpw5cBoVrnoMRc/G/yBYTw2YrVP6uWDa4mT9GS4MqLzrE6VkQ91ePn82w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1686427997;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2FyW3Bj3MP4r2QbMriRspWC1T3TG2cIZbpm8o1sYXRk=;
	b=bgPUpEic0mpyby3BGyAvEpiW4XSnGc6In+X8PMucBYAVIRaPTCmQlzaXQV9yZA55ZBey2P
	6Kr948u6T/TlPVBw==
To: Michael Ellerman <mpe@ellerman.id.au>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/9] cpu/SMT: Allow enabling partial SMT states via sysfs
In-Reply-To: <87r0qj84fr.ffs@tglx>
References: <20230524155630.794584-1-mpe@ellerman.id.au>
 <20230524155630.794584-6-mpe@ellerman.id.au> <87r0qj84fr.ffs@tglx>
Date: Sat, 10 Jun 2023 22:13:17 +0200
Message-ID: <87o7ln849u.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linux-arch@vger.kernel.org, x86@kernel.org, dave.hansen@linux.intel.com, mingo@redhat.com, bp@alien8.de, ldufour@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jun 10 2023 at 22:09, Thomas Gleixner wrote:

> On Thu, May 25 2023 at 01:56, Michael Ellerman wrote:
>> There is a hook which allows arch code to control how many threads per
>
> Can you please write out architecture in changelogs and comments?
>
> I know 'arch' is commonly used but while my brain parser tolerates
> 'arch_' prefixes it raises an exception on 'arch' in prose as 'arch' is
> a regular word with a completely different meaning. Changelogs and
> comments are not space constraint.
>
>> @@ -2505,20 +2505,38 @@ __store_smt_control(struct device *dev, struct device_attribute *attr,
>>  	if (cpu_smt_control == CPU_SMT_NOT_SUPPORTED)
>>  		return -ENODEV;
>>  
>> -	if (sysfs_streq(buf, "on"))
>> +	if (sysfs_streq(buf, "on")) {
>>  		ctrlval = CPU_SMT_ENABLED;
>> -	else if (sysfs_streq(buf, "off"))
>> +		num_threads = cpu_smt_max_threads;
>> +	} else if (sysfs_streq(buf, "off")) {
>>  		ctrlval = CPU_SMT_DISABLED;
>> -	else if (sysfs_streq(buf, "forceoff"))
>> +		num_threads = 1;
>> +	} else if (sysfs_streq(buf, "forceoff")) {
>>  		ctrlval = CPU_SMT_FORCE_DISABLED;
>> -	else
>> +		num_threads = 1;
>> +	} else if (kstrtoint(buf, 10, &num_threads) == 0) {
>> +		if (num_threads == 1)
>> +			ctrlval = CPU_SMT_DISABLED;
>> +		else if (num_threads > 1 && topology_smt_threads_supported(num_threads))

Why does this not simply check cpu_smt_max_threads?

		else if (num_threads > 1 && num_threads <= cpu_smt_max_threads)

cpu_smt_max_threads should have been established already, no?

Thanks,

        tglx
