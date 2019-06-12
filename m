Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9D142898
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 16:18:19 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45P89M36MCzDr3j
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2019 00:18:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=fbarrat@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45P865359MzDqtV
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jun 2019 00:15:24 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5CEFGr9120207
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 10:15:21 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2t31mrv9rm-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 10:15:19 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <fbarrat@linux.ibm.com>;
 Wed, 12 Jun 2019 15:10:37 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 12 Jun 2019 15:10:34 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5CEAXYR40763460
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Jun 2019 14:10:34 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 650CA4C070;
 Wed, 12 Jun 2019 14:10:33 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3C91E4C046;
 Wed, 12 Jun 2019 14:10:33 +0000 (GMT)
Received: from bali.lab.toulouse-stg.fr.ibm.com (unknown [9.101.4.17])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 12 Jun 2019 14:10:33 +0000 (GMT)
Subject: Re: [PATCH] cxl: no need to check return value of debugfs_create
 functions
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arnd Bergmann <arnd@arndb.de>
References: <20190611181309.GA17098@kroah.com>
 <CAK8P3a1otKxoJUNH=-tZfzFy9qzQQc61i8AZPh-L7e-Ybd8kpg@mail.gmail.com>
 <20190612100226.GA18368@kroah.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
Date: Wed, 12 Jun 2019 16:10:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190612100226.GA18368@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19061214-4275-0000-0000-00000341B106
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19061214-4276-0000-0000-00003851C7A0
Message-Id: <e887909b-00d4-c6d9-2bda-677ad2685f64@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-12_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906120096
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Andrew Donnellan <ajd@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 12/06/2019 à 12:02, Greg Kroah-Hartman a écrit :
> On Wed, Jun 12, 2019 at 11:51:21AM +0200, Arnd Bergmann wrote:
>> On Tue, Jun 11, 2019 at 8:13 PM Greg Kroah-Hartman
>> <gregkh@linuxfoundation.org> wrote:
>>
>>> @@ -64,8 +64,6 @@ int cxl_debugfs_adapter_add(struct cxl *adapter)
>>>
>>>          snprintf(buf, 32, "card%i", adapter->adapter_num);
>>>          dir = debugfs_create_dir(buf, cxl_debugfs);
>>> -       if (IS_ERR(dir))
>>> -               return PTR_ERR(dir);
>>>          adapter->debugfs = dir;
>>>
>>
>> Should the check for 'cxl_debugfs' get removed here as well?
> 
> Maybe, I could not determine the logic if those functions could be
> called before cxl_debugfs was ever set.
> 
> And debugfs_create_dir() will not return a NULL value if an error
> happens, so no need to worry about files being created in the wrong
> place.
> 
>> If that is null, we might put the subdir in the wrong place in the
>> tree, but that would otherwise be harmless as well, and the
>> same thing happens if 'dir' is NULL above and we add the
>> files in the debugfs root later (losing the ability to clean up
>> afterwards).
>>
>> int cxl_debugfs_adapter_add(struct cxl *adapter)
>> {
>>          struct dentry *dir;
>>          char buf[32];
>>
>>          if (!cxl_debugfs)
>>                  return -ENODEV;
>>
>> It's still a bit odd to return an error, since the caller then just
>> ignores the return code anway:
> 
> Then let's just return nothing.
> 
>>          /* Don't care if this one fails: */
>>          cxl_debugfs_adapter_add(adapter);
>>
>> It would seem best to change the return type to 'void' here for
>> consistency.
> 
> I agree, let me go do that.


I don't see any problems with turning all those function return types to 
'void'. Thanks for pointing it out and the clean up!

   Fred



> thanks,
> 
> greg k-h
> 

