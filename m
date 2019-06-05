Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD3C3584E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2019 10:04:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45JhC04YhgzDqb5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2019 18:04:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ozlabs.ru
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.b="nvNDOPin"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Jh9D5RM7zDqL2
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jun 2019 18:02:40 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id u22so14384870pfm.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Jun 2019 01:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cUls1j6D4PoknWVg6IU22ZNi5ROn4DTEddxipTzZKZA=;
 b=nvNDOPinjqq7j91XgZ5ycpN1TfkI99R1t1bAW/IMjj2VdnfmWu9IFifR6GdF9v3/bQ
 DJkMgq1Ktp6J7oYGV1lject9QqsUHlzkvu8YWgW9ruUji69JInJhGXfHuZMmpx7vpavs
 +ZUdp38eaQ5YOdBUqjRrlOh6C3eSa3ZOZUrI2DDpnqJ/iNVp5WRSu5QXEkdFPWRQ7Z7z
 LfHmBNiU25jHCP8P54ZYikHWs6UW7a3sPYmz1Z+yvjWnprDqX2JB+VX1WsWVB+yHHDxK
 fSrH1UVP1iHcd6caIVCTPD2qqLuEBsZLzzu43U7Os5UuAbxluE2n20D6z2bGZm+b+m/0
 kCgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=cUls1j6D4PoknWVg6IU22ZNi5ROn4DTEddxipTzZKZA=;
 b=n2oKDccskyYgeYUZ8TRSbVKYNUl0E/0HmofFZM/p89U25DpyY1ig5eKFPt3wouzbCA
 n7NOLNkjKk4RmsLH24HzegeFCFc2X0q0Lg5io4hdOwaxOhEqjM/pM/NMNKjWOrYHKS/u
 MLOv3Z5/229GFunYgbIwtyMMDv1GTSWmxVa3+15W/UhQoFncLcVNXt4EFevSWUnzd9eD
 MLgmeNEhnMInq32/t02tX4WJff3UMAYjliUg3yF+sN1nNjhjXNtD60kxvVC7WhwzbRZc
 4w7xOTdD9HdcSvLL6i9lFSztrMkvYLzXdFg2AiytxdR7YPTbbwbig4+Ca98UOJ0hfgQk
 u93g==
X-Gm-Message-State: APjAAAVFSiOsmMGSXrM/1uYGXGJ+viyEvJnmK09IpJSXyVJp1rtmpQwG
 DbQfSRuyDiNFURZyX40UKCY037eoOGs=
X-Google-Smtp-Source: APXvYqzKtRfXdpVqGpnJl8Tp+A/LQwx6SkyBrZw/hpjADqJ5CN+wuDfoFOuF1vTUHvcPVDYaNkJkIw==
X-Received: by 2002:a17:90a:778c:: with SMTP id
 v12mr40443777pjk.141.1559721758266; 
 Wed, 05 Jun 2019 01:02:38 -0700 (PDT)
Received: from [10.61.2.175] ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id j2sm24778913pfb.157.2019.06.05.01.02.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 05 Jun 2019 01:02:37 -0700 (PDT)
Subject: Re: [PATCH] powerpc/nvdimm: Add support for multibyte read/write for
 metadata
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, npiggin@gmail.com,
 paulus@samba.org, mpe@ellerman.id.au
References: <20190602044350.31660-1-aneesh.kumar@linux.ibm.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Openpgp: preference=signencrypt
Autocrypt: addr=aik@ozlabs.ru; keydata=
 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
Message-ID: <fcb825c4-39fe-5c0f-0eed-764723295d54@ozlabs.ru>
Date: Wed, 5 Jun 2019 18:02:33 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190602044350.31660-1-aneesh.kumar@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
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
Cc: linuxppc-dev@lists.ozlabs.org, oohall@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 02/06/2019 14:43, Aneesh Kumar K.V wrote:
> SCM_READ/WRITE_MEATADATA hcall supports multibyte read/write. This patch
> updates the metadata read/write to use 1, 2, 4 or 8 byte read/write as
> mentioned in PAPR document.
> 
> READ/WRITE_METADATA hcall supports the 1, 2, 4, or 8 bytes read/write.
> For other values hcall results H_P3.
> 
> Hypervisor stores the metadata contents in big-endian format and in-order
> to enable read/write in different granularity, we need to switch the contents
> to big-endian before calling HCALL.
> 
> Based on an patch from Oliver O'Halloran <oohall@gmail.com>
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  arch/powerpc/platforms/pseries/papr_scm.c | 104 +++++++++++++++++-----
>  1 file changed, 82 insertions(+), 22 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
> index 0176ce66673f..e33cebb8ee6c 100644
> --- a/arch/powerpc/platforms/pseries/papr_scm.c
> +++ b/arch/powerpc/platforms/pseries/papr_scm.c
> @@ -97,42 +97,102 @@ static int drc_pmem_unbind(struct papr_scm_priv *p)
>  }
>  
>  static int papr_scm_meta_get(struct papr_scm_priv *p,
> -			struct nd_cmd_get_config_data_hdr *hdr)
> +			     struct nd_cmd_get_config_data_hdr *hdr)
>  {
>  	unsigned long data[PLPAR_HCALL_BUFSIZE];
> +	unsigned long offset, data_offset;
> +	int len, read;
>  	int64_t ret;
>  
> -	if (hdr->in_offset >= p->metadata_size || hdr->in_length != 1)
> +	if ((hdr->in_offset + hdr->in_length) >= p->metadata_size)
>  		return -EINVAL;
>  
> -	ret = plpar_hcall(H_SCM_READ_METADATA, data, p->drc_index,
> -			hdr->in_offset, 1);
> -
> -	if (ret == H_PARAMETER) /* bad DRC index */
> -		return -ENODEV;
> -	if (ret)
> -		return -EINVAL; /* other invalid parameter */
> -
> -	hdr->out_buf[0] = data[0] & 0xff;
> -
> +	for (len = hdr->in_length; len; len -= read) {
> +
> +		data_offset = hdr->in_length - len;
> +		offset = hdr->in_offset + data_offset;
> +
> +		if (len >= 8)
> +			read = 8;
> +		else if (len >= 4)
> +			read = 4;
> +		else if ( len >= 2)

Do not need a space before "len".


> +			read = 2;
> +		else
> +			read = 1;
> +
> +		ret = plpar_hcall(H_SCM_READ_METADATA, data, p->drc_index,
> +				  offset, read);
> +
> +		if (ret == H_PARAMETER) /* bad DRC index */
> +			return -ENODEV;
> +		if (ret)
> +			return -EINVAL; /* other invalid parameter */
> +
> +		switch (read) {
> +		case 8:
> +			*(uint64_t *)(hdr->out_buf + data_offset) = be64_to_cpu(data[0]);
> +			break;
> +		case 4:
> +			*(uint32_t *)(hdr->out_buf + data_offset) = be32_to_cpu(data[0] & 0xffffffff);
> +			break;
> +
> +		case 2:
> +			*(uint16_t *)(hdr->out_buf + data_offset) = be16_to_cpu(data[0] & 0xffff);
> +			break;
> +
> +		case 1:
> +			*(uint32_t *)(hdr->out_buf + data_offset) = (data[0] & 0xff);


Memory corruption, should be uint8_t*.


> +			break;
> +		}
> +	}
>  	return 0;
>  }
>  
>  static int papr_scm_meta_set(struct papr_scm_priv *p,
> -			struct nd_cmd_set_config_hdr *hdr)
> +			     struct nd_cmd_set_config_hdr *hdr)
>  {
> +	unsigned long offset, data_offset;
> +	int len, wrote;
> +	unsigned long data;
> +	__be64 data_be;
>  	int64_t ret;
>  
> -	if (hdr->in_offset >= p->metadata_size || hdr->in_length != 1)
> +	if ((hdr->in_offset + hdr->in_length) >= p->metadata_size)
>  		return -EINVAL;
>  
> -	ret = plpar_hcall_norets(H_SCM_WRITE_METADATA,
> -			p->drc_index, hdr->in_offset, hdr->in_buf[0], 1);
> -
> -	if (ret == H_PARAMETER) /* bad DRC index */
> -		return -ENODEV;
> -	if (ret)
> -		return -EINVAL; /* other invalid parameter */
> +	for (len = hdr->in_length; len; len -= wrote) {
> +
> +		data_offset = hdr->in_length - len;
> +		offset = hdr->in_offset + data_offset;
> +
> +		if (len >= 8) {
> +			data = *(uint64_t *)(hdr->in_buf + data_offset);
> +			data_be = cpu_to_be64(data);
> +			wrote = 8;
> +		} else if (len >= 4) {
> +			data = *(uint32_t *)(hdr->in_buf + data_offset);
> +			data &= 0xffffffff;


Why do you need &0xffffffff here and below (&0xffff, &0xff)? uint32_t is
unsigned type so the sign bit won't be extended.


> +			data_be = cpu_to_be32(data);
> +			wrote = 4;
> +		} else if (len >= 2) {
> +			data = *(uint16_t *)(hdr->in_buf + data_offset);
> +			data &= 0xffff;
> +			data_be = cpu_to_be16(data);
> +			wrote = 2;
> +		} else {
> +			data_be = *(uint8_t *)(hdr->in_buf + data_offset);
> +			data_be &= 0xff;
> +			wrote = 1;
> +		}
> +
> +		ret = plpar_hcall_norets(H_SCM_WRITE_METADATA, p->drc_index,
> +					 offset, data_be, wrote);
> +		if (ret == H_PARAMETER) /* bad DRC index */
> +			return -ENODEV;
> +		if (ret)
> +			return -EINVAL; /* other invalid parameter */
> +	}
>  
>  	return 0;
>  }
> @@ -154,7 +214,7 @@ int papr_scm_ndctl(struct nvdimm_bus_descriptor *nd_desc, struct nvdimm *nvdimm,
>  		get_size_hdr = buf;
>  
>  		get_size_hdr->status = 0;
> -		get_size_hdr->max_xfer = 1;
> +		get_size_hdr->max_xfer = 8;
>  		get_size_hdr->config_size = p->metadata_size;
>  		*cmd_rc = 0;
>  		break;
> 

-- 
Alexey
