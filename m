Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0029BE5272
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2019 19:38:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 470BDZ5THczDqtY
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Oct 2019 04:38:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 470BBP44jszDqkL
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Oct 2019 04:37:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 470BBP0fVmz8tFp
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Oct 2019 04:37:01 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 470BBP0Bplz9sPc; Sat, 26 Oct 2019 04:37:01 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nayna@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 470BBN3HH3z9sP3;
 Sat, 26 Oct 2019 04:37:00 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9PHaqRD051337; Fri, 25 Oct 2019 13:36:52 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2vv3ck4y7w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Oct 2019 13:36:51 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x9PHapUW051275;
 Fri, 25 Oct 2019 13:36:51 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2vv3ck4y5b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Oct 2019 13:36:51 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x9PHZ6h9003745;
 Fri, 25 Oct 2019 17:36:43 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma01dal.us.ibm.com with ESMTP id 2vqt47t7v7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Oct 2019 17:36:42 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x9PHae5p63373682
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Oct 2019 17:36:40 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A6D60C605F;
 Fri, 25 Oct 2019 17:36:40 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8F66AC6057;
 Fri, 25 Oct 2019 17:36:38 +0000 (GMT)
Received: from [9.85.155.79] (unknown [9.85.155.79])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 25 Oct 2019 17:36:38 +0000 (GMT)
Subject: Re: [PATCH v9 7/8] ima: check against blacklisted hashes for files
 with modsig
To: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 Nayna Jain <nayna@linux.ibm.com>, linuxppc-dev@ozlabs.org,
 linux-efi@vger.kernel.org, linux-integrity@vger.kernel.org
References: <20191024034717.70552-1-nayna@linux.ibm.com>
 <20191024034717.70552-8-nayna@linux.ibm.com>
 <8e6dde58-17c2-a834-9ec3-1271b4ffd3a8@linux.microsoft.com>
From: Nayna Jain <nayna@linux.vnet.ibm.com>
Message-ID: <c051d807-59a1-5dd0-40b7-be0867f0e43a@linux.vnet.ibm.com>
Date: Fri, 25 Oct 2019 12:36:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <8e6dde58-17c2-a834-9ec3-1271b4ffd3a8@linux.microsoft.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-25_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=746 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910250161
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Eric Ricther <erichte@linux.ibm.com>, Prakhar Srivastava <prsriva02@gmail.com>,
 linux-kernel@vger.kernel.org, Mimi Zohar <zohar@linux.ibm.com>,
 Claudio Carvalho <cclaudio@linux.ibm.com>,
 Matthew Garret <matthew.garret@nebula.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Paul Mackerras <paulus@samba.org>, Jeremy Kerr <jk@ozlabs.org>,
 Elaine Palmer <erpalmer@us.ibm.com>, Oliver O'Halloran <oohall@gmail.com>,
 George Wilson <gcwilson@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 10/24/19 12:48 PM, Lakshmi Ramasubramanian wrote:
> On 10/23/2019 8:47 PM, Nayna Jain wrote:
>
>> +/*
>> + * ima_check_blacklist - determine if the binary is blacklisted.
>> + *
>> + * Add the hash of the blacklisted binary to the measurement list, 
>> based
>> + * on policy.
>> + *
>> + * Returns -EPERM if the hash is blacklisted.
>> + */
>> +int ima_check_blacklist(struct integrity_iint_cache *iint,
>> +            const struct modsig *modsig, int pcr)
>> +{
>> +    enum hash_algo hash_algo;
>> +    const u8 *digest = NULL;
>> +    u32 digestsize = 0;
>> +    int rc = 0;
>> +
>> +    if (!(iint->flags & IMA_CHECK_BLACKLIST))
>> +        return 0;
>> +
>> +    if (iint->flags & IMA_MODSIG_ALLOWED && modsig) {
>> +        ima_get_modsig_digest(modsig, &hash_algo, &digest, 
>> &digestsize);
>> +
>> +        rc = is_binary_blacklisted(digest, digestsize);
>> +        if ((rc == -EPERM) && (iint->flags & IMA_MEASURE))
>> +            process_buffer_measurement(digest, digestsize,
>> +                           "blacklisted-hash", NONE,
>> +                           pcr);
>> +    }
>
> The enum value "NONE" is being passed to process_buffer_measurement to 
> indicate that the check for required action based on ima policy is 
> already done by ima_check_blacklist. Not sure, but this can cause 
> confusion in the future when someone updates process_buffer_measurement.


As I explained in the response to other patch, the purpose is to 
indicate that it is an auxiliary measurement record. By passing func as 
NONE, it implies there is no explicit policy to be queried for the 
template as it is an additional record for an existing policy and is to 
use ima-buf template.

What type of confusion do you mean ?

Thanks & Regards,

      - Nayna

