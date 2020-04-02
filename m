Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7166719CDAF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 01:55:45 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tg1V4y9MzDrcC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 10:55:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=au1.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ellerman@au1.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=au1.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tfzR19GFzDrbx
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Apr 2020 10:53:54 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 032NYR9d006056
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 2 Apr 2020 19:53:53 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 304swtdnfp-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Apr 2020 19:53:52 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ellerman@au1.ibm.com>;
 Fri, 3 Apr 2020 00:53:31 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 3 Apr 2020 00:53:29 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 032NrlSL45678592
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 2 Apr 2020 23:53:47 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C55705204E;
 Thu,  2 Apr 2020 23:53:47 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 7167E52054;
 Thu,  2 Apr 2020 23:53:47 +0000 (GMT)
Received: from localhost (unknown [9.102.33.58])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id ACB2DA01BF;
 Fri,  3 Apr 2020 10:53:41 +1100 (AEDT)
From: Michael Ellerman <ellerman@au1.ibm.com>
To: Vaibhav Jain <vajain21@vajain21.in.ibm.com.in.ibm.com>,
 Vaibhav Jain <vaibhav@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-nvdimm@lists.01.org
Subject: Re: [PATCH v5 1/4] powerpc/papr_scm: Fetch nvdimm health information
 from PHYP
In-Reply-To: <87o8s9g2nv.fsf@vajain21.in.ibm.com>
References: <20200331143229.306718-1-vaibhav@linux.ibm.com>
 <20200331143229.306718-2-vaibhav@linux.ibm.com>
 <878sjetcis.fsf@mpe.ellerman.id.au> <87o8s9g2nv.fsf@vajain21.in.ibm.com>
Date: Fri, 03 Apr 2020 10:53:55 +1100
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 20040223-0020-0000-0000-000003C079C7
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20040223-0021-0000-0000-000022192745
Message-Id: <87y2rdsauk.fsf@mpe.ellerman.id.au>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-02_13:2020-04-02,
 2020-04-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=1
 bulkscore=0 clxscore=1015 lowpriorityscore=0 mlxlogscore=559 phishscore=0
 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004020169
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
Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Jeff Moyer <jmoyer@redhat.com>, alastair@linux.ibm.com,
 Oliver O'Halloran <oohall@gmail.com>, Vishal Verma <vishal.l.verma@intel.com>,
 Vaibhav Jain <vaibhav@linux.ibm.com>, Dan Williams <dan.j.williams@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Vaibhav Jain <vajain21@vajain21.in.ibm.com.in.ibm.com> writes:
> Thanks for reviewing this patch Mpe,
> Michael Ellerman <ellerman@au1.ibm.com> writes:
>> Vaibhav Jain <vaibhav@linux.ibm.com> writes:
...
>>
>>> +	/* Check for various masks in bitmap and set the buffer */
>>> +	if (health & PAPR_SCM_DIMM_UNARMED_MASK)
>>> +		rc += sprintf(buf, "not_armed ");
>>
>> I know buf is "big enough" but using sprintf() in 2020 is a bit ... :)
>>
>> seq_buf is a pretty thin wrapper over a buffer you can use to make this
>> cleaner and also handles overflow for you.
>>
>> See eg. show_user_instructions() for an example.
>
> Unfortunatly seq_buf_printf() is still not an exported symbol hence not
> usable in external modules.

Send a patch? :)

cheers

