Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2EE6C6ADF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Mar 2023 15:25:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pj71K41j8z3f7M
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Mar 2023 01:25:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OT/poq/Y;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OT/poq/Y;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OT/poq/Y;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OT/poq/Y;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pj70P1Cyhz3cfZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Mar 2023 01:25:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679581505;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3cxY0YlR+Nav9cgoRAEQz2NR9PgUGMwQJGMBNInuMHU=;
	b=OT/poq/YR3OKyCGXT0AdvsI6n9BhFvPhvUVO73f6r2D1yaP/ojvEAcTOlel5J+Rx0AkL0o
	WbNiDsPQI2tLtVpsqT17mpgFSb8BnvhJOEujVCcbuayoO693KcCHBoSxymGiEBN34NcaGK
	3M7NhPsSEwcjEDVa4SvQin9Z81qaqOk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679581505;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3cxY0YlR+Nav9cgoRAEQz2NR9PgUGMwQJGMBNInuMHU=;
	b=OT/poq/YR3OKyCGXT0AdvsI6n9BhFvPhvUVO73f6r2D1yaP/ojvEAcTOlel5J+Rx0AkL0o
	WbNiDsPQI2tLtVpsqT17mpgFSb8BnvhJOEujVCcbuayoO693KcCHBoSxymGiEBN34NcaGK
	3M7NhPsSEwcjEDVa4SvQin9Z81qaqOk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-426-xLeABINfNyKWQwOx9FyqQA-1; Thu, 23 Mar 2023 10:16:04 -0400
X-MC-Unique: xLeABINfNyKWQwOx9FyqQA-1
Received: by mail-wm1-f69.google.com with SMTP id bi27-20020a05600c3d9b00b003e9d0925341so10367905wmb.8
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Mar 2023 07:16:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679580963;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3cxY0YlR+Nav9cgoRAEQz2NR9PgUGMwQJGMBNInuMHU=;
        b=XnJ9EpcLknvzJQma+wzwOiHkmLp//Suhb86Jx4AJ8IMEfqgGpMRhQ9UO1j0AiMjjwL
         dLeX1qarwTCoAXgdCAfXCv4vf8q4RvkuJQeyTbqWYVV8VToqMDdy8kJfkPPyWfeISY0H
         kmLNWj7KLV/NltXa2F8fpMOOTWq87OtIzCPvK1uQHHmrSejhHvE9EqCzwNNSw8je/c6r
         +91+iPluf4l0/uf6tyxWP0efgznXf0tzCocEDXL5kkQk0wBhsnMHd19JAEVZXx5uTY/W
         /pOWI32sSUtKAdi6ouSya0M625ruyxOIaTrRjhLT40ZqW6ygxdfUjIVo/9SlceLVLsii
         6SpA==
X-Gm-Message-State: AO0yUKVzdWu2aM2pYFGb15pUHeT0aWCkc+iEPbYJ04KCivx2B8gGkr/u
	UI9UyR99Gaa6qk8aqnRQrsza8/r80bpt+AU7LWvlX0ylZbB4LorMDQbTozk9At5M4WxiO4ML0AZ
	XvC2wbPC83wwDBdm/Q/OLW2cE2Q==
X-Received: by 2002:a1c:4c0d:0:b0:3ed:abb9:7515 with SMTP id z13-20020a1c4c0d000000b003edabb97515mr2479434wmf.11.1679580963329;
        Thu, 23 Mar 2023 07:16:03 -0700 (PDT)
X-Google-Smtp-Source: AK7set/3oWB5oheY84MnPANpjGZQTPaBGqoPuX1i8xTQHcr1RbVYlWVK0NfEAlBy0IX+fO2f9pUY1A==
X-Received: by 2002:a1c:4c0d:0:b0:3ed:abb9:7515 with SMTP id z13-20020a1c4c0d000000b003edabb97515mr2479417wmf.11.1679580963039;
        Thu, 23 Mar 2023 07:16:03 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-179-146.web.vodafone.de. [109.43.179.146])
        by smtp.gmail.com with ESMTPSA id v4-20020a05600c470400b003ee8ab8d6cfsm1991913wmo.21.2023.03.23.07.16.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Mar 2023 07:16:02 -0700 (PDT)
Message-ID: <9745a2df-1902-6b4c-d617-19fc2e56c909@redhat.com>
Date: Thu, 23 Mar 2023 15:16:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [kvm-unit-tests v2 10/10] powerpc/sprs: Test hypervisor registers
 on powernv machine
To: Nicholas Piggin <npiggin@gmail.com>, kvm@vger.kernel.org
References: <20230320070339.915172-1-npiggin@gmail.com>
 <20230320070339.915172-11-npiggin@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230320070339.915172-11-npiggin@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: Laurent Vivier <lvivier@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 20/03/2023 08.03, Nicholas Piggin wrote:
> This enables HV privilege registers to be tested with the powernv
> machine.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   powerpc/sprs.c | 31 ++++++++++++++++++++++++-------
>   1 file changed, 24 insertions(+), 7 deletions(-)
> 
> diff --git a/powerpc/sprs.c b/powerpc/sprs.c
> index dd83dac..a7878ff 100644
> --- a/powerpc/sprs.c
> +++ b/powerpc/sprs.c
> @@ -199,16 +199,16 @@ static const struct spr sprs_power_common[1024] = {
>   [190] = {"HFSCR",	64,	HV_RW, },
>   [256] = {"VRSAVE",	32,	RW, },
>   [259] = {"SPRG3",	64,	RO, },
> -[284] = {"TBL",		32,	HV_WO, },
> -[285] = {"TBU",		32,	HV_WO, },
> -[286] = {"TBU40",	64,	HV_WO, },
> +[284] = {"TBL",		32,	HV_WO, }, /* Things can go a bit wonky with */
> +[285] = {"TBU",		32,	HV_WO, }, /* Timebase changing. Should save */
> +[286] = {"TBU40",	64,	HV_WO, }, /* and restore it. */
>   [304] = {"HSPRG0",	64,	HV_RW, },
>   [305] = {"HSPRG1",	64,	HV_RW, },
>   [306] = {"HDSISR",	32,	HV_RW,		SPR_INT, },
>   [307] = {"HDAR",	64,	HV_RW,		SPR_INT, },
>   [308] = {"SPURR",	64,	HV_RW | OS_RO,	SPR_ASYNC, },
>   [309] = {"PURR",	64,	HV_RW | OS_RO,	SPR_ASYNC, },
> -[313] = {"HRMOR",	64,	HV_RW, },
> +[313] = {"HRMOR",	64,	HV_RW,		SPR_HARNESS, }, /* Harness can't cope with HRMOR changing */
>   [314] = {"HSRR0",	64,	HV_RW,		SPR_INT, },
>   [315] = {"HSRR1",	64,	HV_RW,		SPR_INT, },
>   [318] = {"LPCR",	64,	HV_RW, },
> @@ -350,6 +350,22 @@ static const struct spr sprs_power10_pmu[1024] = {
>   
>   static struct spr sprs[1024];
>   
> +static bool spr_read_perms(int spr)
> +{
> +	if (machine_is_powernv())
> +		return !!(sprs[spr].access & SPR_HV_READ);
> +	else
> +		return !!(sprs[spr].access & SPR_OS_READ);
> +}
> +
> +static bool spr_write_perms(int spr)
> +{
> +	if (machine_is_powernv())
> +		return !!(sprs[spr].access & SPR_HV_WRITE);
> +	else
> +		return !!(sprs[spr].access & SPR_OS_WRITE);
> +}
> +
>   static void setup_sprs(void)
>   {
>   	uint32_t pvr = mfspr(287);	/* Processor Version Register */
> @@ -462,7 +478,7 @@ static void get_sprs(uint64_t *v)
>   	int i;
>   
>   	for (i = 0; i < 1024; i++) {
> -		if (!(sprs[i].access & SPR_OS_READ))
> +		if (!spr_read_perms(i))
>   			continue;
>   		v[i] = mfspr(i);
>   	}
> @@ -473,8 +489,9 @@ static void set_sprs(uint64_t val)
>   	int i;
>   
>   	for (i = 0; i < 1024; i++) {
> -		if (!(sprs[i].access & SPR_OS_WRITE))
> +		if (!spr_write_perms(i))
>   			continue;
> +
>   		if (sprs[i].type & SPR_HARNESS)
>   			continue;
>   		if (!strcmp(sprs[i].name, "MMCR0")) {
> @@ -546,7 +563,7 @@ int main(int argc, char **argv)
>   	for (i = 0; i < 1024; i++) {
>   		bool pass = true;
>   
> -		if (!(sprs[i].access & SPR_OS_READ))
> +		if (!spr_read_perms(i))
>   			continue;
>   
>   		if (sprs[i].width == 32) {

Acked-by: Thomas Huth <thuth@redhat.com>

