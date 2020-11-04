Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B73432A6C44
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Nov 2020 18:56:09 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CRDpt6PqFzDqdD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Nov 2020 04:56:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=drt@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=aeEWS0hb; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CRDn65GMLzDqY6
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Nov 2020 04:54:31 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A4HXnx0018078; Wed, 4 Nov 2020 12:54:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=mime-version : date :
 from : to : cc : subject : in-reply-to : references : message-id :
 content-type : content-transfer-encoding; s=pp1;
 bh=uoGKHjVI9qCmgMT7Z13+wCWlgoPk1FdTmCEv9WQfshk=;
 b=aeEWS0hb1HQX8G0wD6qXlogTejASPSaHGEYeXKnii7xoNkWjNlXDIXRiqCvxxiS0mQ3F
 lwoh/SjoFBfEXjGySionVF5nw7I0zJ5JLnFe1TsMbb44wWY8GQBc5Q1fFAlP630tya2X
 S2vhuMKZwSOelDOU4e8OdJ7iYZiZ4arCegcl2uLy9G6Sr1SFVlEzYIiRHmSWWnfMUWZ5
 TO+WuxZfSx/yFJKLiJ9TcfAvxWsmmnCB5CPEvuisU/gCpwBhKNtqMhg/sqzCWIvpbejP
 ND1HO3uU+PY0D/DYeehu4sF3Ab5w7/HWuJJexawo8rf2wb7vefBYXx2rDCcl/jyCqF4w lA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34kxep5vcv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Nov 2020 12:54:15 -0500
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0A4HXxCZ019183;
 Wed, 4 Nov 2020 12:54:15 -0500
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34kxep5vcm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Nov 2020 12:54:15 -0500
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0A4HppCV001558;
 Wed, 4 Nov 2020 17:54:14 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma04wdc.us.ibm.com with ESMTP id 34h0ej06xw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Nov 2020 17:54:14 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0A4HsEkb4260454
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 4 Nov 2020 17:54:14 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 35A59124054;
 Wed,  4 Nov 2020 17:54:14 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BF419124052;
 Wed,  4 Nov 2020 17:54:12 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  4 Nov 2020 17:54:12 +0000 (GMT)
MIME-Version: 1.0
Date: Wed, 04 Nov 2020 09:54:12 -0800
From: drt <drt@linux.vnet.ibm.com>
To: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 09/12] net: ethernet: ibm: ibmvnic: Fix some kernel-doc
 misdemeanours
In-Reply-To: <20201104133815.GC933237@lunn.ch>
References: <20201104090610.1446616-1-lee.jones@linaro.org>
 <20201104090610.1446616-10-lee.jones@linaro.org>
 <20201104133815.GC933237@lunn.ch>
Message-ID: <85bc60fb363b95bc87627607d20b3616@linux.vnet.ibm.com>
X-Sender: drt@linux.vnet.ibm.com
User-Agent: Roundcube Webmail/1.0.1
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-04_11:2020-11-04,
 2020-11-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=999
 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0 clxscore=1011
 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011040126
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
Cc: Thomas Falcon <tlfalcon@linux.vnet.ibm.com>,
 Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
 Santiago Leon <santi_leon@yahoo.com>, John Allen <jallen@linux.vnet.ibm.com>,
 netdev@vger.kernel.org, Lijun Pan <ljp@linux.ibm.com>,
 linux-arm-kernel@lists.infradead.org, Dany Madden <drt@linux.ibm.com>,
 kuba@kernel.org, Sukadev Bhattiprolu <sukadev@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net,
 Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2020-11-04 05:38, Andrew Lunn wrote:
> On Wed, Nov 04, 2020 at 09:06:07AM +0000, Lee Jones wrote:
>> Fixes the following W=1 kernel build warning(s):
>> 
>>  from drivers/net/ethernet/ibm/ibmvnic.c:35:
>>  inlined from ‘handle_vpd_rsp’ at 
>> drivers/net/ethernet/ibm/ibmvnic.c:4124:3:
>>  drivers/net/ethernet/ibm/ibmvnic.c:1362: warning: Function parameter 
>> or member 'hdr_field' not described in 'build_hdr_data'
>>  drivers/net/ethernet/ibm/ibmvnic.c:1362: warning: Function parameter 
>> or member 'skb' not described in 'build_hdr_data'
>>  drivers/net/ethernet/ibm/ibmvnic.c:1362: warning: Function parameter 
>> or member 'hdr_len' not described in 'build_hdr_data'
>>  drivers/net/ethernet/ibm/ibmvnic.c:1362: warning: Function parameter 
>> or member 'hdr_data' not described in 'build_hdr_data'
>>  drivers/net/ethernet/ibm/ibmvnic.c:1423: warning: Function parameter 
>> or member 'hdr_field' not described in 'create_hdr_descs'
>>  drivers/net/ethernet/ibm/ibmvnic.c:1423: warning: Function parameter 
>> or member 'hdr_data' not described in 'create_hdr_descs'
>>  drivers/net/ethernet/ibm/ibmvnic.c:1423: warning: Function parameter 
>> or member 'len' not described in 'create_hdr_descs'
>>  drivers/net/ethernet/ibm/ibmvnic.c:1423: warning: Function parameter 
>> or member 'hdr_len' not described in 'create_hdr_descs'
>>  drivers/net/ethernet/ibm/ibmvnic.c:1423: warning: Function parameter 
>> or member 'scrq_arr' not described in 'create_hdr_descs'
>>  drivers/net/ethernet/ibm/ibmvnic.c:1474: warning: Function parameter 
>> or member 'txbuff' not described in 'build_hdr_descs_arr'
>>  drivers/net/ethernet/ibm/ibmvnic.c:1474: warning: Function parameter 
>> or member 'num_entries' not described in 'build_hdr_descs_arr'
>>  drivers/net/ethernet/ibm/ibmvnic.c:1474: warning: Function parameter 
>> or member 'hdr_field' not described in 'build_hdr_descs_arr'
>>  drivers/net/ethernet/ibm/ibmvnic.c:1832: warning: Function parameter 
>> or member 'adapter' not described in 'do_change_param_reset'
>>  drivers/net/ethernet/ibm/ibmvnic.c:1832: warning: Function parameter 
>> or member 'rwi' not described in 'do_change_param_reset'
>>  drivers/net/ethernet/ibm/ibmvnic.c:1832: warning: Function parameter 
>> or member 'reset_state' not described in 'do_change_param_reset'
>>  drivers/net/ethernet/ibm/ibmvnic.c:1911: warning: Function parameter 
>> or member 'adapter' not described in 'do_reset'
>>  drivers/net/ethernet/ibm/ibmvnic.c:1911: warning: Function parameter 
>> or member 'rwi' not described in 'do_reset'
>>  drivers/net/ethernet/ibm/ibmvnic.c:1911: warning: Function parameter 
>> or member 'reset_state' not described in 'do_reset'
>> 
>> Cc: Dany Madden <drt@linux.ibm.com>
>> Cc: Lijun Pan <ljp@linux.ibm.com>
>> Cc: Sukadev Bhattiprolu <sukadev@linux.ibm.com>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>> Cc: Paul Mackerras <paulus@samba.org>
>> Cc: "David S. Miller" <davem@davemloft.net>
>> Cc: Jakub Kicinski <kuba@kernel.org>
>> Cc: Santiago Leon <santi_leon@yahoo.com>
>> Cc: Thomas Falcon <tlfalcon@linux.vnet.ibm.com>
>> Cc: John Allen <jallen@linux.vnet.ibm.com>
>> Cc: netdev@vger.kernel.org
>> Cc: linuxppc-dev@lists.ozlabs.org
>> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>

Reviewed-by: Dany Madden <drt@linux.ibm.com>

Thanks, Lee.
Dany
> 
>     Andrew
