Return-Path: <linuxppc-dev+bounces-17389-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKxrEO2NoWnouAQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17389-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Feb 2026 13:28:29 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 571C71B7127
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Feb 2026 13:28:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fMnfx58g0z3bmR;
	Fri, 27 Feb 2026 23:28:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=115.124.30.99
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772195305;
	cv=none; b=S6FD9jlM7RicIicIzYITJCc7LAEzn7j9nAiGmoD0iu2MCxabXa0VOXQ1v3INNNy3WOOIKBFmkz1ynOS/YWIgAJbJn0Dk3C1ZkaB4DvdZrJwVFOT3+ibpZTKNWwk68D/Rkm32eReIoLBr4KfFmW6W5xj2H5IV+05GDpewmzeqhc1BtR9iWU4SfU0ry1qfVQZooKzB7CZD0Nojk8zC5jOmOD5G7aHuFrjHMCPeewVsIeDWG0s0J1WKzzMBiB/rJVKEaEgDpyyvyLrI3YU8+JMLR+iBxj4I70Xd7ciTQQ+ve6jFyqycFemdghDn1m8i9z+AR5wbiRbpHuExWlxcWaVqow==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772195305; c=relaxed/relaxed;
	bh=YAnptZhgz1649pWMwYw9NqZhdnSslf/yjACo95roL/I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IV2QNoXNwbYG3JASKCc3fQotAhqHliJxa9v4SYigF9hMc4fdl4I5bgce4EJIsYEbX4Cp1hsTsslufbRKb2VDKSPYXcfheJdIDeoj9Fhc805tIevGVu57Uo4xgLBMTjclcZ+8zVUESSPPNIQQ3bZbLtx5yx9DCpQIteEHXs/v0QDkLg/k0mb4Aeezfoh0eFo+rOYVPLXT1NZH2cNi2q98TwkxuWT4GHIVZf9ypC88U8OGNZzK7QdqhdGLVXl0qbU/yaeNZWQknHpw6gWycQqVWHH1nAMoR7HX4PUCL0lWzAW0zlWOw0Gs6bs5zReJmmlsuRxfy6lREq2XhUMUYNE/Hw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=x+W4cYDW; dkim-atps=neutral; spf=pass (client-ip=115.124.30.99; helo=out30-99.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.alibaba.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=x+W4cYDW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.99; helo=out30-99.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-99.freemail.mail.aliyun.com (out30-99.freemail.mail.aliyun.com [115.124.30.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fMnft5Sm6z30N8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Feb 2026 23:28:21 +1100 (AEDT)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1772195293; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=YAnptZhgz1649pWMwYw9NqZhdnSslf/yjACo95roL/I=;
	b=x+W4cYDWOzbQZ+6UpmqRzIU8PULTOcBB1HHbP2m8NryA7G5YqnwqhU1lO0zZhwq0i10EXRCu1i4aphZvTqtKb+mD5VqNYibmUqgvnYLHzQdbiTFYeuSfkXcii/sXa8tfUZxYdB0/NncXBWRcyUkuTQpxLVzSLH7y24UbBPyGaZU=
Received: from 30.246.163.43(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WzuNC9i_1772195290 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 27 Feb 2026 20:28:11 +0800
Message-ID: <a0ec1ce8-06cc-463d-86b4-a6d6a625a808@linux.alibaba.com>
Date: Fri, 27 Feb 2026 20:28:17 +0800
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
 <924dce22-171e-4508-907c-74f57f1bdea8@linux.alibaba.com>
 <234dcf9e-05ff-485c-a330-019a4fbb5f3b@linux.alibaba.com>
 <aaF2PAOZsHr4PuC_@wunner.de>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <aaF2PAOZsHr4PuC_@wunner.de>
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
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[linux.alibaba.com:s=default];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17389-lists,linuxppc-dev=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.alibaba.com:mid,linux.alibaba.com:dkim,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 571C71B7127
X-Rspamd-Action: no action



On 2/27/26 6:47 PM, Lukas Wunner wrote:
> On Fri, Feb 27, 2026 at 04:28:59PM +0800, Shuai Xue wrote:
>> On 2/7/26 3:48 PM, Shuai Xue wrote:
>>> Regarding pci_restore_state() in slot_reset(): I see now that it does
>>> call pci_aer_clear_status(dev) (at line 1844 in pci.c), which will
>>> clear the AER Status registers. So if we walk the hierarchy after
>>> the slot_reset callbacks, the error bits accumulated during DPC will
>>> already be cleared.
>>>
>>> To avoid losing those errors, I think the walk should happen after
>>> dpc_reset_link() succeeds but *before* pcie_do_recovery() invokes the
>>> slot_reset callbacks. That way, we can capture the AER Status bits
>>> before pci_restore_state() clears them.
>>>
>>> Does that sound like the right approach, or would you prefer a
>>> different placement?
> 
> The problem is that if the hierarchy that was reset is deeper than
> one level, you first need to call pci_restore_state() on all the
> PCIe Upstream and Downstream Ports that were reset before you can
> access the Endpoints at the bottom of the hierarchy.
> 
> E.g. if DPC occurs at a Root Port with multiple nested PCIe switches
> below, the Endpoints at the "leafs" of that tree are only accessible
> once Config Space has been restored at all the PCIe switches
> in-between the Endpoints and the DPC-capable Root Port.
> 
> Hence your proposal unfortunately won't work.
> 
> I think the solution is to move pci_aer_clear_status() out of
> pci_restore_state() into the callers that actually need it.
> But that requires going through every single caller.
> I've begun doing that last week and am about 60% done.
> 
> Once pci_restore_state() no longer clears the error bits, we can
> report and clear them after the "report_slot_reset" stage (which
> is where drivers call pci_restore_state()).
> 
> I've also changed my mind and I think reporting and clearing
> the error bits *could* happen in pcie_do_recovery() even if it
> were used for EEH and s390 because those platforms may plug in
> AER-capable devices as well and so we do need to clear the bits
> regardless of the error recovery mechanism used.
> 
> Let me get back to you once I've gone through all the callers of
> pci_restore_state().  Please be patient.
> 

Sure, glad to hear you have been working on that.


Thanks.
SHuai


