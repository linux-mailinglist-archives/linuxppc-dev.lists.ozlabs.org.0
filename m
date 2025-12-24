Return-Path: <linuxppc-dev+bounces-14976-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C630CDB1DF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Dec 2025 02:58:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dbZlz0V9pz2xlM;
	Wed, 24 Dec 2025 12:58:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=115.124.30.119
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766541502;
	cv=none; b=FqdSvBRjReQvoBeHYbgqxB7TXTZNxgRiT2+fly5QZvUPgjla7sCTe5/kR7QUKlSgkFcN8bRBofEqy/C0YiapFdQMFG7YiK2WL7jkFqWTFxDe+hZtgP3xjm106uyBGXWYmAVrrJLaN+YHP0hr8en/jENt7m8wfSlBMgRsOR3c37DkcV3o4OUfDcIoLdqPrZG87S6FwQ/RJjGBaySDjn/tZdv+SMXCXGht4AOGdsa/09DWApmulPxC4tEqihbwQt5qUZjwP2QYp2Mhuav1x1ttPvyHj/pee+JP+pMu/vBsbc99yL8wLJafow/44vYlGlLkZ1am9DZW5weJpIhDEbnqWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766541502; c=relaxed/relaxed;
	bh=vpb/Ndy+7I56xYp04RK+U275InGboh5GyjLPiBNNVmE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kKY68HHeb1WAkLS33zH0MsEDleojtiW8NmuX01AR0X+qTYZHZWIQjU9ADdeOF7KKwta/qDQgqOp4GUqMLDC5DPj6Jc/jIvgiFTGmyeFVGkQW1qmt4BEskV6yzhXicI2r3MgkAtGFJukJeWydF5r8klizyIcMLfrR1PwcD1RkUBGZaI6LHxBdhVtmD4Ms/IPrIi834aHeHFVqSom4s+umShrDaddJys6Dz2+9mUJx5Ccyia+kXrqxr0KrseqIMhjg8dkXH6N9vfgp4ML6Kc+b7zplrTD3AwvnWSPC34tygs18CgOC6MjH7rYMnBcKERspbDAAIy/OelXnv9j0ZAvWcw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=BGvBXEBr; dkim-atps=neutral; spf=pass (client-ip=115.124.30.119; helo=out30-119.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.alibaba.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=BGvBXEBr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.119; helo=out30-119.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-119.freemail.mail.aliyun.com (out30-119.freemail.mail.aliyun.com [115.124.30.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dbZlw40bvz2xP9
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Dec 2025 12:58:18 +1100 (AEDT)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1766541492; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=vpb/Ndy+7I56xYp04RK+U275InGboh5GyjLPiBNNVmE=;
	b=BGvBXEBrWR7/KzLo2KNjbkw5hBC+NeQjOor44Ea/i4fwe+9Sseo/aRhcEZO5d41nrUkXDYX8CR9uE5EeUr4Ay0Rrync7/93xEhtU281Ft3ERmDK/7bAdId6KneMrW8NJNeI5Zs5JA3k4CQpjScbXF4sqTUtZdpeGbkZTb0m9ctg=
Received: from 30.246.163.226(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WvZQeTD_1766541489 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 24 Dec 2025 09:58:10 +0800
Message-ID: <b1b0071f-ce69-41ac-adc8-54fb0bdb7116@linux.alibaba.com>
Date: Wed, 24 Dec 2025 09:58:09 +0800
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
Subject: Re: [PATCH 1/5 v8] ACPI: extlog: Trace CPER Non-standard Section Body
To: "Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>,
 linux-cxl@vger.kernel.org
Cc: Rafael J Wysocki <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
 Hanjun Guo <guohanjun@huawei.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Davidlohr Bueso <dave@stgolabs.net>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Dave Jiang <dave.jiang@intel.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Qiuxu Zhuo <qiuxu.zhuo@intel.com>
References: <20251219124042.3759749-1-fabio.m.de.francesco@linux.intel.com>
 <20251219124042.3759749-2-fabio.m.de.francesco@linux.intel.com>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <20251219124042.3759749-2-fabio.m.de.francesco@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-15.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 12/19/25 8:39 PM, Fabio M. De Francesco wrote:
> ghes_do_proc() has a catch-all for unknown or unhandled CPER formats
> (UEFI v2.11 Appendix N 2.3), extlog_print() does not. This gap was
> noticed by a RAS test that injected CXL protocol errors which were
> notified to extlog_print() via the IOMCA (I/O Machine Check
> Architecture) mechanism. Bring parity to the extlog_print() path by
> including a similar log_non_standard_event().
> 
> Cc: Dan Williams <dan.j.williams@intel.com>
> Reviewed-by: Dan Williams <dan.j.williams@intel.com>
> Reviewed-by: Dave Jiang <dave.jiang@intel.com>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
> Reviewed-by: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
> Signed-off-by: Fabio M. De Francesco <fabio.m.de.francesco@linux.intel.com>
> ---
>   drivers/acpi/acpi_extlog.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/acpi/acpi_extlog.c b/drivers/acpi/acpi_extlog.c
> index f6b9562779de0..47d11cb5c9120 100644
> --- a/drivers/acpi/acpi_extlog.c
> +++ b/drivers/acpi/acpi_extlog.c
> @@ -183,6 +183,12 @@ static int extlog_print(struct notifier_block *nb, unsigned long val,
>   			if (gdata->error_data_length >= sizeof(*mem))
>   				trace_extlog_mem_event(mem, err_seq, fru_id, fru_text,
>   						       (u8)gdata->error_severity);
> +		} else {
> +			void *err = acpi_hest_get_payload(gdata);
> +
> +			log_non_standard_event(sec_type, fru_id, fru_text,
> +					       gdata->error_severity, err,
> +					       gdata->error_data_length);
>   		}
>   	}
>   

Reviewed-by: Shuai Xue <xueshuai@linux.alibaba.com>

Thanks.
Shuai

