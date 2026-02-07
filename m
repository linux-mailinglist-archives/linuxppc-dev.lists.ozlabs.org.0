Return-Path: <linuxppc-dev+bounces-16708-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHgsH5XuhmnwSAQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16708-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sat, 07 Feb 2026 08:49:41 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CAAA1052A4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 07 Feb 2026 08:49:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f7NQP6yNnz2ydq;
	Sat, 07 Feb 2026 18:49:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=115.124.30.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770450573;
	cv=none; b=TzRtL4HCSz8XAbnyMVUiEoQx6egO+xrcgOQEhYzTF/xViEgSmaldD09vFbIR0UXMmGKX8ApcNQ9hrm/VtwdE6Ee76SfPKk+lR2YyWvYhZTU+IOqL+XPLYTAAZ/cB9vh3Fn4zRY+7wRjHtrYmy9et+ncgQFywmtRMghiER4jfQJMamEzO1YwnPCBtURTWfz1dUpBlau/MdihPaeirYQmaL2yOMXP96uqdBCbUZ+822T7omB538qU6THiyq/wjYxNq7A0RE/H+yTj0J5pri787fW+VD9m0f1ZOMaUlazthSQlcR0DmEXCkJCDZjAIQQxTqcRynmALYMvv1poULtAxULw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770450573; c=relaxed/relaxed;
	bh=LHc3SXs3IglbN0dRzOuqXsju9nOLE6/m2styMOamf7w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=khat7/Az4Ig+3j7TBJftEeBTbNpiBhLgn4j9Iif8E8+uZo0a8ZAOPRm6xm+jEkT71m9q9uVc+/JLLmJSkbRG3iRZNbHFbNQAQ+nD+Nsf8vDuC6nVrPgeOwXNiAOqt7v4pXRJ8oXtZObMIMi3G8hel1dWppa1H3k3JHMV61ptC16z7IaXXGYYR7SHLZSzY7yt5s9jnAzoZcIx27+InXpQ5qGSEkodMStmWYagIC8QKM4aE1hmF5jCfv3xWPBmJOxQB6peXlDt/OZNyGbDX1FeJlVuO33XUiFzePyM1boVFZloDyfNjKHQCtp5t+U3MkuRENgIs06B/ppA+7aNTz25jQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=Ye3Il9L2; dkim-atps=neutral; spf=pass (client-ip=115.124.30.131; helo=out30-131.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.alibaba.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=Ye3Il9L2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.131; helo=out30-131.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-131.freemail.mail.aliyun.com (out30-131.freemail.mail.aliyun.com [115.124.30.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f7NQL1mG2z2xWJ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 07 Feb 2026 18:49:28 +1100 (AEDT)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1770450559; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=LHc3SXs3IglbN0dRzOuqXsju9nOLE6/m2styMOamf7w=;
	b=Ye3Il9L2+c0IKpUS3/8dwe9OESTWFtU+sjMcn5XJjym0enckmsvCaeK7Af6RhKPiX9GGuUVbjqlbnMHcHsYSXItCAbUaMmMhlfKsmc8yjezTDTN/tIGy7nYaRmuWUjmr0kkm8caJHPQ6F7SnsfuZM4zpGgYxZazJvrobco57lB4=
Received: from 30.246.162.188(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WyhThvz_1770450556 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sat, 07 Feb 2026 15:49:17 +0800
Message-ID: <924dce22-171e-4508-907c-74f57f1bdea8@linux.alibaba.com>
Date: Sat, 7 Feb 2026 15:48:07 +0800
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
Subject: Re: [PATCH v7 2/5] PCI/DPC: Run recovery on device that detected the
 error
To: Lukas Wunner <lukas@wunner.de>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, bhelgaas@google.com, kbusch@kernel.org,
 sathyanarayanan.kuppuswamy@linux.intel.com, mahesh@linux.ibm.com,
 oohall@gmail.com, Jonathan.Cameron@huawei.com, terry.bowman@amd.com,
 tianruidong@linux.alibaba.com
References: <20260124074557.73961-1-xueshuai@linux.alibaba.com>
 <20260124074557.73961-3-xueshuai@linux.alibaba.com>
 <aYCujqZIvxElSsOE@wunner.de> <aYESh4bCE2lzTg2S@wunner.de>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <aYESh4bCE2lzTg2S@wunner.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-15.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-9.21 / 15.00];
	WHITELIST_DMARC(-7.00)[alibaba.com:D:+];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.alibaba.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[linux.alibaba.com:s=default];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16708-lists,linuxppc-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lukas@wunner.de,m:linux-pci@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:bhelgaas@google.com,m:kbusch@kernel.org,m:sathyanarayanan.kuppuswamy@linux.intel.com,m:mahesh@linux.ibm.com,m:oohall@gmail.com,m:Jonathan.Cameron@huawei.com,m:terry.bowman@amd.com,m:tianruidong@linux.alibaba.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[xueshuai@linux.alibaba.com,linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.ozlabs.org,google.com,kernel.org,linux.intel.com,linux.ibm.com,gmail.com,huawei.com,amd.com,linux.alibaba.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xueshuai@linux.alibaba.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[linux.alibaba.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 5CAAA1052A4
X-Rspamd-Action: no action



On 2/3/26 5:09 AM, Lukas Wunner wrote:
> On Mon, Feb 02, 2026 at 03:02:54PM +0100, Lukas Wunner wrote:
>> You're assuming that the parent of the Requester is always identical
>> to the containing Downstream Port.  But that's not necessarily the case:
>>
>> E.g., imagine a DPC-capable Root Port with a PCIe switch below
>> whose Downstream Ports are not DPC-capable.  Let's say an Endpoint
>> beneath the PCIe switch sends ERR_FATAL upstream.  AFAICS, your patch
>> will cause pcie_do_recovery() to invoke dpc_reset_link() with the
>> Downstream Port of the PCIe switch as argument.  That function will
>> then happily use pdev->dpc_cap even though it's 0.
> 
> Thinking about this some more, I realized there's another problem:
> 
> In a scenario like the one I've outlined above, after your change,
> pcie_do_recovery() will only broadcast error_detected (and other
> callbacks) below the downstream port of the PCIe switch -- and not
> to any other devices below the containing Root Port.
> 
> However, the DPC-induced Link Down event at the Root Port results
> in a Hot Reset being propagated down the hierarchy to any device
> below the Root Port.  So with your change, the siblings of the
> downstream port on the PCIe switch will no longer be informed of
> the reset and thus are no longer given an opportunity to recover
> after reset.
> 
> The premise on which this patch is built is false -- that the bridge
> upstream of the error-reporting device is always equal to the
> containing Downstream Port.

Thanks again for the very detailed analysis and for the pointers to
your earlier mail.

You are right, thanks for pointing it out.

> 
> It seems the only reason why you want to pass the reporting device
> to pcie_do_recovery() is that you want to call pcie_clear_device_status()
> and pci_aer_clear_nonfatal_status() with that device.

In the AER path, pcie_do_recovery() is indeed invoked with the Error
Source device found by find_source_device(), and internally it treats
that dev as the function that detected the error and derives the
containing Downstream Port (bridge) from it.  For DPC, however, the
error-detecting function is the DPC-capable Downstream Port itself, not
the Endpoint identified as Error Source, so passing the Endpoint to
pcie_do_recovery() breaks that assumption.
> 
> However as I've said before, those calls are AER-specific and should
> be moved out of pcie_do_recovery() so that it becomes generic and can
> be used by EEH and s390:
> 
> https://lore.kernel.org/all/aPYKe1UKKkR7qrt1@wunner.de/

Sure, I'd like to move it out.  I will remove the AER-specific calls
(pcie_clear_device_status() and pci_aer_raw_clear_status()) from
pcie_do_recovery() itself, and instead handle them in the AER and DPC
code paths where we already know which device(s) are the actual error
sources.  That way, pcie_do_recovery() becomes a generic recovery
framework that can be reused by EEH and s390.

> 
> There's another problem:  When a device experiences an error while DPC
> is ongoing (i.e. while the link is down), its ERR_FATAL or ERR_NONFATAL
> Message may not come through.  Still the error bits are set in the
> device's Uncorrectable Error Status register.  So I think what we need to
> do is walk the hierarchy below the containing Downstream Port after the
> link is back up and search for devices with any error bits set,
> then report and clear those errors.  We may do this after first
> examining the device in the DPC Error Source ID register.
> Any additional errors found while walking the hierarchy can then
> be identified as "occurred during DPC recovery".

I agree this is similar in spirit to find_source_device() -- both walk
the bus and check AER Status registers.  For the DPC case, I'll perform
this walk after the link is back up (i.e., after dpc_reset_link()
succeeds).

Regarding pci_restore_state() in slot_reset(): I see now that it does
call pci_aer_clear_status(dev) (at line 1844 in pci.c), which will
clear the AER Status registers.  So if we walk the hierarchy after
the slot_reset callbacks, the error bits accumulated during DPC will
already be cleared.

To avoid losing those errors, I think the walk should happen after
dpc_reset_link() succeeds but *before* pcie_do_recovery() invokes the
slot_reset callbacks.  That way, we can capture the AER Status bits
before pci_restore_state() clears them.

Does that sound like the right approach, or would you prefer a
different placement?

Thanks a lot for your guidance.

Best Regards,
Shuai


