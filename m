Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B63572B63
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2019 11:30:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45tqnw6ycjzDq9m
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2019 19:30:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ldufour@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45tqkr3zdJzDqL7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jul 2019 19:27:48 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6O9Rej5032995
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jul 2019 05:27:45 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2txjmcdhm5-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jul 2019 05:27:45 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ldufour@linux.vnet.ibm.com>;
 Wed, 24 Jul 2019 10:27:42 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 24 Jul 2019 10:27:40 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6O9RcAv39583988
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 24 Jul 2019 09:27:38 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 548D6AE045;
 Wed, 24 Jul 2019 09:27:38 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 06568AE04D;
 Wed, 24 Jul 2019 09:27:38 +0000 (GMT)
Received: from pomme.lab.toulouse-stg.fr.ibm.com (unknown [9.101.4.33])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 24 Jul 2019 09:27:37 +0000 (GMT)
Subject: Re: [PATCH v5 4/4] powerpc/papr_scm: Force a scm-unbind if initial
 scm-bind fails
To: "Oliver O'Halloran" <oohall@gmail.com>
References: <20190723161357.26718-1-vaibhav@linux.ibm.com>
 <20190723161357.26718-5-vaibhav@linux.ibm.com>
 <fa75968e-1417-ef02-4f5e-5ba34c778377@linux.vnet.ibm.com>
 <CAOSf1CFA14eRY66J0gHAvNnWGzFTFmb3-RKQ3+XjrqdG0jxk6g@mail.gmail.com>
From: Laurent Dufour <ldufour@linux.vnet.ibm.com>
Date: Wed, 24 Jul 2019 11:27:37 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAOSf1CFA14eRY66J0gHAvNnWGzFTFmb3-RKQ3+XjrqdG0jxk6g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19072409-0016-0000-0000-00000295A2FE
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19072409-0017-0000-0000-000032F396EE
Message-Id: <ee9b6b91-3e43-9436-6e3a-b0dc73179dd1@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-24_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1907240105
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
Cc: Vaibhav Jain <vaibhav@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le 24/07/2019 à 11:24, Oliver O'Halloran a écrit :
> On Wed, Jul 24, 2019 at 7:17 PM Laurent Dufour
> <ldufour@linux.vnet.ibm.com> wrote:
>>
>> Le 23/07/2019 à 18:13, Vaibhav Jain a écrit :
>>> *snip*
>>> @@ -404,6 +409,14 @@ static int papr_scm_probe(struct platform_device *pdev)
>>>
>>>        /* request the hypervisor to bind this region to somewhere in memory */
>>>        rc = drc_pmem_bind(p);
>>> +
>>> +     /* If phyp says drc memory still bound then force unbound and retry */
>>> +     if (rc == -EBUSY) {
>>> +             dev_warn(&pdev->dev, "Retrying bind after unbinding\n");
>>> +             drc_pmem_unbind(p);
>>> +             rc = drc_pmem_bind(p);
>>
>> In the unlikely case where H_SCM_BIND_MEM is returning H_OVERLAP once the
>> unbinding has been done, the error would be silently processed. That sounds
>> really unlikely, but should an error message be displayed in this
>> particular case ?
> 
> drc_pmem_bind() prints the h-call error code if we get one, so it's not silent

That's no more the case whith this patch, H_OVERLAP is handled before 
writing the error message, which would make sense for the first try.

For the record, the patch introduces:

@@ -65,6 +66,10 @@ static int drc_pmem_bind(struct papr_scm_priv *p)
  	} while (rc == H_BUSY);

  	if (rc) {
+		/* H_OVERLAP needs a separate error path */
+		if (rc == H_OVERLAP)
+			return -EBUSY;
+
  		dev_err(&p->pdev->dev, "bind err: %lld\n", rc);
  		return -ENXIO;
  	}

