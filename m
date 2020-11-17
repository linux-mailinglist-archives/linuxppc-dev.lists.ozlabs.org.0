Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A9D2B7148
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Nov 2020 23:09:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CbKpj6R7KzDqQJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Nov 2020 09:09:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=brking@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=GAMAWdfV; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CbKmM2w4CzDqPj
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Nov 2020 09:06:58 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AHM4H5d083997; Tue, 17 Nov 2020 17:06:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=ai6BAreswhyDf4MnMxZzL8UpCtwkvNq9pLaziKNJwZA=;
 b=GAMAWdfVh3mlc+7/SZ06WB8euH4+ynkd0/e0UPnnjcm1aUyl35L4v7E9a7WaegG8v7bS
 6E5ZBOwMErfHu6kKDIaJNgsXzn8B4046Ah/iP5FTVsniXIYSQJdktd58B5XBSNxtFHjT
 RFZEDyfeSrAGtjx4t6sBiFyLGiWcEnODMyDzPdkM93Nw/0HAtyfNXpHOWVLpVqXdPhbY
 IGGyrDAhwV7xfdYWFy+UQ2nmtZHmt5i1nKaZBedsIj9426+Fvt5PRE4E3rDQlnIKpTLn
 hEJm0OAVxVy4SlCyYd/M9NhNGaXoLr9b5xcUe9EzynZk75wdmROPZd2Lcy7k1KVFD9SA Ww== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34vfd8f0x0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Nov 2020 17:06:54 -0500
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AHM1wxj029891;
 Tue, 17 Nov 2020 22:06:52 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma02wdc.us.ibm.com with ESMTP id 34vfj9tud1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Nov 2020 22:06:52 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AHM6pKX3277442
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Nov 2020 22:06:51 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7DC091363AD;
 Tue, 17 Nov 2020 22:06:51 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0E0491363AF;
 Tue, 17 Nov 2020 22:06:50 +0000 (GMT)
Received: from oc6034535106.ibm.com (unknown [9.163.40.231])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 17 Nov 2020 22:06:50 +0000 (GMT)
Subject: Re: [PATCH 3/6] ibmvfc: add new fields for version 2 of several MADs
To: Tyrel Datwyler <tyreld@linux.ibm.com>,
 james.bottomley@hansenpartnership.com
References: <20201112010442.102589-1-tyreld@linux.ibm.com>
 <20201112010442.102589-3-tyreld@linux.ibm.com>
From: Brian King <brking@linux.vnet.ibm.com>
Message-ID: <5b772ce2-3119-f05b-15d3-357729e46e70@linux.vnet.ibm.com>
Date: Tue, 17 Nov 2020 16:06:50 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201112010442.102589-3-tyreld@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-17_12:2020-11-17,
 2020-11-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 clxscore=1011 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxlogscore=999
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011170162
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
Cc: brking@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 linux-scsi@vger.kernel.org, martin.petersen@oracle.com,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/11/20 7:04 PM, Tyrel Datwyler wrote:
> @@ -211,7 +214,9 @@ struct ibmvfc_npiv_login_resp {
>  	__be64 capabilities;
>  #define IBMVFC_CAN_FLUSH_ON_HALT	0x08
>  #define IBMVFC_CAN_SUPPRESS_ABTS	0x10
> -#define IBMVFC_CAN_SUPPORT_CHANNELS	0x20
> +#define IBMVFC_MAD_VERSION_CAP		0x20
> +#define IBMVFC_HANDLE_VF_WWPN		0x40
> +#define IBMVFC_CAN_SUPPORT_CHANNELS	0x80
>  	__be32 max_cmds;
>  	__be32 scsi_id_sz;
>  	__be64 max_dma_len;
> @@ -293,6 +298,7 @@ struct ibmvfc_port_login {
>  	__be32 reserved2;
>  	struct ibmvfc_service_parms service_parms;
>  	struct ibmvfc_service_parms service_parms_change;
> +	__be64 targetWWPN;

For consistency, can you make this target_wwpn?

>  	__be64 reserved3[2];
>  } __packed __aligned(8);
>  
> @@ -344,6 +350,7 @@ struct ibmvfc_process_login {
>  	__be16 status;
>  	__be16 error;			/* also fc_reason */
>  	__be32 reserved2;
> +	__be64 targetWWPN;

For consistency, can you make this target_wwpn?

>  	__be64 reserved3[2];
>  } __packed __aligned(8);
>  
> @@ -378,6 +385,8 @@ struct ibmvfc_tmf {
>  	__be32 cancel_key;
>  	__be32 my_cancel_key;
>  	__be32 pad;
> +	__be64 targetWWPN;

For consistency, can you make this target_wwpn?

> +	__be64 taskTag;

and make this task_tag. 

>  	__be64 reserved[2];
>  } __packed __aligned(8);
>  
> @@ -474,9 +483,19 @@ struct ibmvfc_cmd {
>  	__be64 correlation;
>  	__be64 tgt_scsi_id;
>  	__be64 tag;
> -	__be64 reserved3[2];
> -	struct ibmvfc_fcp_cmd_iu iu;
> -	struct ibmvfc_fcp_rsp rsp;
> +	__be64 targetWWPN;

For consistency, can you make this target_wwpn?

> +	__be64 reserved3;
> +	union {
> +		struct {
> +			struct ibmvfc_fcp_cmd_iu iu;
> +			struct ibmvfc_fcp_rsp rsp;
> +		} v1;
> +		struct {
> +			__be64 reserved4;
> +			struct ibmvfc_fcp_cmd_iu iu;
> +			struct ibmvfc_fcp_rsp rsp;
> +		} v2;
> +	};
>  } __packed __aligned(8);
>  
>  struct ibmvfc_passthru_fc_iu {
> @@ -503,6 +522,7 @@ struct ibmvfc_passthru_iu {
>  	__be64 correlation;
>  	__be64 scsi_id;
>  	__be64 tag;
> +	__be64 targetWWPN;

For consistency, can you make this target_wwpn?

>  	__be64 reserved2[2];
>  } __packed __aligned(8);
>  
> 


-- 
Brian King
Power Linux I/O
IBM Linux Technology Center

