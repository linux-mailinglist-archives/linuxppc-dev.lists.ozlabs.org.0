Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A27B37487
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2019 14:52:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45KQY744J2zDqjj
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2019 22:52:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45KQVS1YV3zDqjJ
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jun 2019 22:50:06 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x56CheCP087339
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 6 Jun 2019 08:50:03 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2sy0bm90w3-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Jun 2019 08:50:02 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <aneesh.kumar@linux.ibm.com>;
 Thu, 6 Jun 2019 13:49:59 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 6 Jun 2019 13:49:56 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x56Cnu6m23003466
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 6 Jun 2019 12:49:56 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D3EFEAE04D;
 Thu,  6 Jun 2019 12:49:55 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 67909AE051;
 Thu,  6 Jun 2019 12:49:54 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.85.84.230])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  6 Jun 2019 12:49:54 +0000 (GMT)
X-Mailer: emacs 26.2 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, npiggin@gmail.com, paulus@samba.org, 
 mpe@ellerman.id.au
Subject: Re: [PATCH] powerpc/nvdimm: Add support for multibyte read/write for
 metadata
In-Reply-To: <fcb825c4-39fe-5c0f-0eed-764723295d54@ozlabs.ru>
References: <20190602044350.31660-1-aneesh.kumar@linux.ibm.com>
 <fcb825c4-39fe-5c0f-0eed-764723295d54@ozlabs.ru>
Date: Thu, 06 Jun 2019 18:19:52 +0530
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 19060612-0012-0000-0000-000003258A0F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19060612-0013-0000-0000-0000215E717A
Message-Id: <87blzaho9b.fsf@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-06_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=18 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906060091
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
Cc: oohall@gmail.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Alexey Kardashevskiy <aik@ozlabs.ru> writes:

> On 02/06/2019 14:43, Aneesh Kumar K.V wrote:
>> SCM_READ/WRITE_MEATADATA hcall supports multibyte read/write. This patch
>> updates the metadata read/write to use 1, 2, 4 or 8 byte read/write as
>> mentioned in PAPR document.
>> 
>> READ/WRITE_METADATA hcall supports the 1, 2, 4, or 8 bytes read/write.
>> For other values hcall results H_P3.
>> 
>> Hypervisor stores the metadata contents in big-endian format and in-order
>> to enable read/write in different granularity, we need to switch the contents
>> to big-endian before calling HCALL.
>> 
>> Based on an patch from Oliver O'Halloran <oohall@gmail.com>
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>>  arch/powerpc/platforms/pseries/papr_scm.c | 104 +++++++++++++++++-----
>>  1 file changed, 82 insertions(+), 22 deletions(-)
>> 
>> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
>> index 0176ce66673f..e33cebb8ee6c 100644
>> --- a/arch/powerpc/platforms/pseries/papr_scm.c
>> +++ b/arch/powerpc/platforms/pseries/papr_scm.c
>> @@ -97,42 +97,102 @@ static int drc_pmem_unbind(struct papr_scm_priv *p)
>>  }
>>  
>>  static int papr_scm_meta_get(struct papr_scm_priv *p,
>> -			struct nd_cmd_get_config_data_hdr *hdr)
>> +			     struct nd_cmd_get_config_data_hdr *hdr)
>>  {
>>  	unsigned long data[PLPAR_HCALL_BUFSIZE];
>> +	unsigned long offset, data_offset;
>> +	int len, read;
>>  	int64_t ret;
>>  
>> -	if (hdr->in_offset >= p->metadata_size || hdr->in_length != 1)
>> +	if ((hdr->in_offset + hdr->in_length) >= p->metadata_size)
>>  		return -EINVAL;
>>  
>> -	ret = plpar_hcall(H_SCM_READ_METADATA, data, p->drc_index,
>> -			hdr->in_offset, 1);
>> -
>> -	if (ret == H_PARAMETER) /* bad DRC index */
>> -		return -ENODEV;
>> -	if (ret)
>> -		return -EINVAL; /* other invalid parameter */
>> -
>> -	hdr->out_buf[0] = data[0] & 0xff;
>> -
>> +	for (len = hdr->in_length; len; len -= read) {
>> +
>> +		data_offset = hdr->in_length - len;
>> +		offset = hdr->in_offset + data_offset;
>> +
>> +		if (len >= 8)
>> +			read = 8;
>> +		else if (len >= 4)
>> +			read = 4;
>> +		else if ( len >= 2)
>
> Do not need a space before "len".

Will fix in next update

>
>
>> +			read = 2;
>> +		else
>> +			read = 1;
>> +
>> +		ret = plpar_hcall(H_SCM_READ_METADATA, data, p->drc_index,
>> +				  offset, read);
>> +
>> +		if (ret == H_PARAMETER) /* bad DRC index */
>> +			return -ENODEV;
>> +		if (ret)
>> +			return -EINVAL; /* other invalid parameter */
>> +
>> +		switch (read) {
>> +		case 8:
>> +			*(uint64_t *)(hdr->out_buf + data_offset) = be64_to_cpu(data[0]);
>> +			break;
>> +		case 4:
>> +			*(uint32_t *)(hdr->out_buf + data_offset) = be32_to_cpu(data[0] & 0xffffffff);
>> +			break;
>> +
>> +		case 2:
>> +			*(uint16_t *)(hdr->out_buf + data_offset) = be16_to_cpu(data[0] & 0xffff);
>> +			break;
>> +
>> +		case 1:
>> +			*(uint32_t *)(hdr->out_buf + data_offset) = (data[0] & 0xff);
>
>
> Memory corruption, should be uint8_t*.

Good catch. That also resulted in an error on big endian kernel. Will
fix that in next update
>
>
>> +			break;
>> +		}
>> +	}
>>  	return 0;
>>  }
>>  
>>  static int papr_scm_meta_set(struct papr_scm_priv *p,
>> -			struct nd_cmd_set_config_hdr *hdr)
>> +			     struct nd_cmd_set_config_hdr *hdr)
>>  {
>> +	unsigned long offset, data_offset;
>> +	int len, wrote;
>> +	unsigned long data;
>> +	__be64 data_be;
>>  	int64_t ret;
>>  
>> -	if (hdr->in_offset >= p->metadata_size || hdr->in_length != 1)
>> +	if ((hdr->in_offset + hdr->in_length) >= p->metadata_size)
>>  		return -EINVAL;
>>  
>> -	ret = plpar_hcall_norets(H_SCM_WRITE_METADATA,
>> -			p->drc_index, hdr->in_offset, hdr->in_buf[0], 1);
>> -
>> -	if (ret == H_PARAMETER) /* bad DRC index */
>> -		return -ENODEV;
>> -	if (ret)
>> -		return -EINVAL; /* other invalid parameter */
>> +	for (len = hdr->in_length; len; len -= wrote) {
>> +
>> +		data_offset = hdr->in_length - len;
>> +		offset = hdr->in_offset + data_offset;
>> +
>> +		if (len >= 8) {
>> +			data = *(uint64_t *)(hdr->in_buf + data_offset);
>> +			data_be = cpu_to_be64(data);
>> +			wrote = 8;
>> +		} else if (len >= 4) {
>> +			data = *(uint32_t *)(hdr->in_buf + data_offset);
>> +			data &= 0xffffffff;
>
>
> Why do you need &0xffffffff here and below (&0xffff, &0xff)? uint32_t is
> unsigned type so the sign bit won't be extended.

Sure. I just want to make sure we don't take extra data. For now I will
keep it as it is and let Michael Ellerman decide to drop that?

>
>
>> +			data_be = cpu_to_be32(data);
>> +			wrote = 4;
>> +		} else if (len >= 2) {
>> +			data = *(uint16_t *)(hdr->in_buf + data_offset);
>> +			data &= 0xffff;
>> +			data_be = cpu_to_be16(data);
>> +			wrote = 2;
>> +		} else {
>> +			data_be = *(uint8_t *)(hdr->in_buf + data_offset);
>> +			data_be &= 0xff;
>> +			wrote = 1;
>> +		}
>> +
>> +		ret = plpar_hcall_norets(H_SCM_WRITE_METADATA, p->drc_index,
>> +					 offset, data_be, wrote);
>> +		if (ret == H_PARAMETER) /* bad DRC index */
>> +			return -ENODEV;
>> +		if (ret)
>> +			return -EINVAL; /* other invalid parameter */
>> +	}
>>  
>>  	return 0;
>>  }
>> @@ -154,7 +214,7 @@ int papr_scm_ndctl(struct nvdimm_bus_descriptor *nd_desc, struct nvdimm *nvdimm,
>>  		get_size_hdr = buf;
>>  
>>  		get_size_hdr->status = 0;
>> -		get_size_hdr->max_xfer = 1;
>> +		get_size_hdr->max_xfer = 8;
>>  		get_size_hdr->config_size = p->metadata_size;
>>  		*cmd_rc = 0;
>>  		break;
>> 
>
> -- 
> Alexey

Thanks for the review
-aneesh

