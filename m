Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 01BAE33C00
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2019 01:35:33 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45HryV3fshzDqV1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2019 09:35:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=tyreld@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45HrxD3zKvzDq75
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jun 2019 09:34:24 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x53NWl0r111800
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 3 Jun 2019 19:34:22 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2swcx4grpv-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Jun 2019 19:34:22 -0400
Received: from localhost
 by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <tyreld@linux.vnet.ibm.com>;
 Tue, 4 Jun 2019 00:34:21 +0100
Received: from b01cxnp22033.gho.pok.ibm.com (9.57.198.23)
 by e13.ny.us.ibm.com (146.89.104.200) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 4 Jun 2019 00:34:18 +0100
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x53NYHtf18546912
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 3 Jun 2019 23:34:17 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7DFEAAC05B;
 Mon,  3 Jun 2019 23:34:17 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 57642AC059;
 Mon,  3 Jun 2019 23:34:16 +0000 (GMT)
Received: from oc6857751186.ibm.com (unknown [9.85.191.102])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  3 Jun 2019 23:34:16 +0000 (GMT)
Subject: Re: [PATCH v2] scsi: ibmvscsi: Don't use rc uninitialized in
 ibmvscsi_do_work
From: Tyrel Datwyler <tyreld@linux.vnet.ibm.com>
To: Nathan Chancellor <natechancellor@gmail.com>,
 Tyrel Datwyler <tyreld@linux.ibm.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
References: <20190531185306.41290-1-natechancellor@gmail.com>
 <20190603221941.65432-1-natechancellor@gmail.com>
 <6fa1dd2e-676f-b12a-5bb6-e86f5c5628fa@linux.vnet.ibm.com>
Date: Mon, 3 Jun 2019 16:34:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <6fa1dd2e-676f-b12a-5bb6-e86f5c5628fa@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19060323-0064-0000-0000-000003E93CB8
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011210; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01212850; UDB=6.00637411; IPR=6.00993910; 
 MB=3.00027171; MTD=3.00000008; XFM=3.00000015; UTC=2019-06-03 23:34:20
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19060323-0065-0000-0000-00003DBA2142
Message-Id: <8598d642-82e3-daad-a487-693208e13c90@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-03_19:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906030158
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
Cc: clang-built-linux@googlegroups.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 06/03/2019 04:25 PM, Tyrel Datwyler wrote:
> On 06/03/2019 03:19 PM, Nathan Chancellor wrote:
>> clang warns:
>>
>> drivers/scsi/ibmvscsi/ibmvscsi.c:2126:7: warning: variable 'rc' is used
>> uninitialized whenever switch case is taken [-Wsometimes-uninitialized]
>>         case IBMVSCSI_HOST_ACTION_NONE:
>>              ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/ibmvscsi/ibmvscsi.c:2151:6: note: uninitialized use occurs
>> here
>>         if (rc) {
>>             ^~
>>
>> Initialize rc to zero in the case statements that clang mentions so that
>> the atomic_set and dev_err statement don't trigger for them.
>>
>> Fixes: 035a3c4046b5 ("scsi: ibmvscsi: redo driver work thread to use enum action states")
>> Link: https://github.com/ClangBuiltLinux/linux/issues/502
>> Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
>> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> 
> Acked-by: Tyrel Datwyler <tyreld@linux.ibm.com>
> 

On second thought NACK. See my response to Michael earlier in the thread.

I think this is the better solution:

diff --git a/drivers/scsi/ibmvscsi/ibmvscsi.c b/drivers/scsi/ibmvscsi/ibmvscsi.c
index 727c31dc11a0..c3cf05dd8733 100644
--- a/drivers/scsi/ibmvscsi/ibmvscsi.c
+++ b/drivers/scsi/ibmvscsi/ibmvscsi.c
@@ -2123,8 +2123,8 @@ static void ibmvscsi_do_work(struct ibmvscsi_host_data
*hostdata)

        spin_lock_irqsave(hostdata->host->host_lock, flags);
        switch (hostdata->action) {
-       case IBMVSCSI_HOST_ACTION_NONE:
        case IBMVSCSI_HOST_ACTION_UNBLOCK:
+               rc = 0;
                break;
        case IBMVSCSI_HOST_ACTION_RESET:
                spin_unlock_irqrestore(hostdata->host->host_lock, flags);
@@ -2142,8 +2142,9 @@ static void ibmvscsi_do_work(struct ibmvscsi_host_data
*hostdata)
                if (!rc)
                        rc = ibmvscsi_send_crq(hostdata, 0xC001000000000000LL, 0);
                break;
+       case IBMVSCSI_HOST_ACTION_NONE:
        default:
-               break;
+               return;
        }

        hostdata->action = IBMVSCSI_HOST_ACTION_NONE;

