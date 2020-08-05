Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBA623CBFD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Aug 2020 18:16:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BMGvW0DVRzDqYh
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Aug 2020 02:16:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BMGsZ5w7FzDqdt
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Aug 2020 02:14:25 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 075G8ceN171119
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 5 Aug 2020 12:14:23 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32qye7sc8w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Aug 2020 12:14:23 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 075G9p1g011267
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 5 Aug 2020 16:14:22 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma01dal.us.ibm.com with ESMTP id 32n019jhxh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Aug 2020 16:14:22 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 075GELcX56099296
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 5 Aug 2020 16:14:21 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B9ADB112063
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Aug 2020 16:14:21 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 73937112062
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Aug 2020 16:14:21 +0000 (GMT)
Received: from oc6857751186.ibm.com (unknown [9.160.55.195])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Aug 2020 16:14:21 +0000 (GMT)
Subject: Re: [PATCH][next] dmaengine: Use fallthrough pseudo-keyword
To: linuxppc-dev@lists.ozlabs.org
References: <20200727203413.GA6245@embeddedor>
 <20200805131922.GZ12965@vkoul-mobl>
From: Tyrel Datwyler <tyreld@linux.ibm.com>
Message-ID: <bcee8f64-6ae6-71b8-5ea0-8b72494cd30b@linux.ibm.com>
Date: Wed, 5 Aug 2020 09:14:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200805131922.GZ12965@vkoul-mobl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-05_13:2020-08-03,
 2020-08-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 mlxlogscore=999 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 phishscore=0 suspectscore=1
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008050130
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 8/5/20 6:19 AM, Vinod Koul wrote:
> On 27-07-20, 15:34, Gustavo A. R. Silva wrote:
> 
>> diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
>> index 2c508ee672b9..9b69716172a4 100644
>> --- a/drivers/dma/pl330.c
>> +++ b/drivers/dma/pl330.c
>> @@ -1061,16 +1061,16 @@ static bool _start(struct pl330_thread *thrd)
>>  
>>  		if (_state(thrd) == PL330_STATE_KILLING)
>>  			UNTIL(thrd, PL330_STATE_STOPPED)
>> -		/* fall through */
>> +		fallthrough;
>>  
>>  	case PL330_STATE_FAULTING:
>>  		_stop(thrd);
>> -		/* fall through */
>> +		fallthrough;
>>  
>>  	case PL330_STATE_KILLING:
>>  	case PL330_STATE_COMPLETING:
>>  		UNTIL(thrd, PL330_STATE_STOPPED)
>> -		/* fall through */
>> +		fallthrough;
>>  
>>  	case PL330_STATE_STOPPED:
>>  		return _trigger(thrd);
>> @@ -1121,7 +1121,6 @@ static u32 _emit_load(unsigned int dry_run, u8 buf[],
>>  
>>  	switch (direction) {
>>  	case DMA_MEM_TO_MEM:
>> -		/* fall through */
>>  	case DMA_MEM_TO_DEV:
>>  		off += _emit_LD(dry_run, &buf[off], cond);
>>  		break;
>> @@ -1155,7 +1154,6 @@ static inline u32 _emit_store(unsigned int dry_run, u8 buf[],
>>  
>>  	switch (direction) {
>>  	case DMA_MEM_TO_MEM:
>> -		/* fall through */
>>  	case DMA_DEV_TO_MEM:
>>  		off += _emit_ST(dry_run, &buf[off], cond);
>>  		break;
>> @@ -1216,7 +1214,6 @@ static int _bursts(struct pl330_dmac *pl330, unsigned dry_run, u8 buf[],
>>  
>>  	switch (pxs->desc->rqtype) {
>>  	case DMA_MEM_TO_DEV:
>> -		/* fall through */
>>  	case DMA_DEV_TO_MEM:
>>  		off += _ldst_peripheral(pl330, dry_run, &buf[off], pxs, cyc,
>>  			cond);
>> @@ -1266,7 +1263,6 @@ static int _dregs(struct pl330_dmac *pl330, unsigned int dry_run, u8 buf[],
>>  
>>  	switch (pxs->desc->rqtype) {
>>  	case DMA_MEM_TO_DEV:
>> -		/* fall through */
> 
> replacement missed here and above few
> 

Its not obvious via most of the documentation, but a case label followed
immediately by another case label is the only allowed implicit fall through as
it is obvious to the eye that there is no postceding statement.

For example the following is legal:

    case FOO:
    	/* fallthrough */ (or fallthrough;)
    case BAR:

is converted to:

    case FOO:
    case BAR:

I would assume the justification is that it is common to have a switch statement
where several case statements fall directly through to a single code block and
annotating each case label seems like overkill.

        switch (vhost->state) {
        case IBMVFC_LINK_DEAD:
        case IBMVFC_HOST_OFFLINE:
                result = DID_NO_CONNECT << 16;
                break;
        case IBMVFC_NO_CRQ:
        case IBMVFC_INITIALIZING:
        case IBMVFC_HALTED:
        case IBMVFC_LINK_DOWN:
                result = DID_REQUEUE << 16;
                break;
        case IBMVFC_ACTIVE:
                result = 0;
                break;
        }

Regards,

Tyrel
