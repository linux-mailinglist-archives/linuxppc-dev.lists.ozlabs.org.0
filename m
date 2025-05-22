Return-Path: <linuxppc-dev+bounces-8875-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E33CAC109D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 May 2025 18:02:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b3CjG6mX8z2yYJ;
	Fri, 23 May 2025 02:02:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=220.197.31.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747929730;
	cv=none; b=LL+yWrPOQ6Q8vgmskNinoFBXjoNpeokqL5ED8uF3O+sXUq3CrtQSIUepVtjg1slywQiiI7xm0Y2nPP9UD+95ytmM2crMFh6KNoo7qSyOpcOSkxyRIe2J3G2qPUuOOaqNGyDt6JZkvRS7Ewb9wV6lTh6q1Aa8Os9bRzsFwLxuuZF7CNnNaQicHzz6I7/SsZsH4PEXmMuQzfQ1s+5lqYjA+pAYy6j5irRpUwB4wLWknsRF6NTpD0uecrlbuZsDoum58hXFJur4aCQb7CnG2KR9+Yw58g6hIAwWOqLy9KfD83OAtwaPVTfq2iI4RW++V2uhFu+CFN3k1VQZZaZA5Tj6Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747929730; c=relaxed/relaxed;
	bh=0AZGXn3LCPEY9S15QKsQn0Bu/8rEFUNP3khAtgVDGKw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bYkAVkcirXAgrzjsdxXl0zxk8yl08c/1/+OXg0snZvcvIm2Vk+2OW+MtfEAQaUxHO5b2K6VPhuVk8bEEysS/KmoFms1NzbrJieVrdYnXtJQr2v1iL6uP5/M9F54RnJRQlDvoReRUypXZa55E4YU9bMz9nctj/yiWzMXirjBC4/GLM3ySFOeE1EltMH760lTpxG7SZgKu00VgyEmjVhTcNYWpflqVR/IpI1TG4gn7KM9P72Pkxvpb/4UXTzcxmC0zd9u08UFt+Xzwn+vpiBaRIalhlagF1zGS8PXp8xOsiYY/WHoDtwhmBBe9cgNYjimZSvLQxqlkAoATu24YoDa46w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=163.com; dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=pKWzNnO5; dkim-atps=neutral; spf=pass (client-ip=220.197.31.5; helo=m16.mail.163.com; envelope-from=18255117159@163.com; receiver=lists.ozlabs.org) smtp.mailfrom=163.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=pKWzNnO5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=163.com (client-ip=220.197.31.5; helo=m16.mail.163.com; envelope-from=18255117159@163.com; receiver=lists.ozlabs.org)
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b3CjD0l7tz2yVv
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 May 2025 02:02:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=0AZGXn3LCPEY9S15QKsQn0Bu/8rEFUNP3khAtgVDGKw=;
	b=pKWzNnO5XPi/51xWxZGHLUBE5xUg3sch9xkRX49/M8KWSiSNF7lEAQuo3FmU/7
	KRQYqXuz8ctRU1QXqUkb5NS9EW5XpDU0Y6mPMZGN9p+b2MkA5X0XqD0Wm6tLHGFX
	ZITh/p3TlrYa7CIp2Da/UllR4Zi0q0kDKR5pe/6/tIuGo=
Received: from [192.168.71.93] (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wDXeqFZSi9ol5cRDQ--.46492S2;
	Fri, 23 May 2025 00:01:30 +0800 (CST)
Message-ID: <403949d7-7c36-4b9a-a079-60a5aa985dd1@163.com>
Date: Fri, 23 May 2025 00:01:29 +0800
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] pci: implement "pci=aer_panic"
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: bhelgaas@google.com, tglx@linutronix.de, kw@linux.com,
 mahesh@linux.ibm.com, oohall@gmail.com, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
References: <20250516165518.125495-1-18255117159@163.com>
 <e2iu7w3sn7m4zwo6ork2mbfjcfixo5jn5ydshkefezsgtquvh6@kjdvxgiapbjj>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <e2iu7w3sn7m4zwo6ork2mbfjcfixo5jn5ydshkefezsgtquvh6@kjdvxgiapbjj>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:_____wDXeqFZSi9ol5cRDQ--.46492S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZrW5KF1rKr4kKr43KFW7Jwb_yoW8XrWkpF
	45tayDKF4DAFyfAFs2g3y0v3yjq3s5Jws8Jrn8Wr1ftr4agF17G34a9FWY9FW7Kr1I9w4S
	vFW0q398tFn8AaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRBMKZUUUUU=
X-Originating-IP: [124.79.114.92]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/1tbiWwRVo2gvRGCRpgAAs9
X-Spam-Status: No, score=0.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_DIGITS,FROM_LOCAL_HEX,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 2025/5/22 19:47, Manivannan Sadhasivam wrote:
> On Sat, May 17, 2025 at 12:55:14AM +0800, Hans Zhang wrote:
>> The following series introduces a new kernel command-line option aer_panic
>> to enhance error handling for PCIe Advanced Error Reporting (AER) in
>> mission-critical environments. This feature ensures deterministic recover
>> from fatal PCIe errors by triggering a controlled kernel panic when device
>> recovery fails, avoiding indefinite system hangs.
>>
>> Problem Statement
>> In systems where unresolved PCIe errors (e.g., bus hangs) occur,
>> traditional error recovery mechanisms may leave the system unresponsive
>> indefinitely. This is unacceptable for high-availability environment
>> requiring prompt recovery via reboot.
>>
>> Solution
>> The aer_panic option forces a kernel panic on unrecoverable AER errors.
>> This bypasses prolonged recovery attempts and ensures immediate reboot.
>>
> 
> You should not panic the kernel when a PCI error occurs (even if it is a fatal
> one). You should instead try to reset the root complex. For that you need this
> series that got merged recently:
> https://lore.kernel.org/all/20250508-pcie-reset-slot-v4-0-7050093e2b50@linaro.org
> 
> PS: You need to populate the slot_reset callback in your controller driver to
> reset the controller in the event of a fatal AER error or link down.

Dear Mani,

Thank you for your reply. I will take a look at the submission record 
you provided.

Best regards,
Hans


