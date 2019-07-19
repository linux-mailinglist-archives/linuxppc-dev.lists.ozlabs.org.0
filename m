Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DEF66E839
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2019 17:50:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45qwSf4R7nzDqgn
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Jul 2019 01:50:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=bauerman@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45qwP76nn7zDqRZ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Jul 2019 01:47:23 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6JFlD8E060713
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jul 2019 11:47:19 -0400
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2tuf6jvvgs-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jul 2019 11:47:19 -0400
Received: from localhost
 by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bauerman@linux.ibm.com>;
 Fri, 19 Jul 2019 16:47:18 +0100
Received: from b01cxnp23033.gho.pok.ibm.com (9.57.198.28)
 by e16.ny.us.ibm.com (146.89.104.203) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 19 Jul 2019 16:47:12 +0100
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6JFlBQD50725154
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Jul 2019 15:47:11 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D8EBAAE05C;
 Fri, 19 Jul 2019 15:47:11 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8ABCAAE05F;
 Fri, 19 Jul 2019 15:47:07 +0000 (GMT)
Received: from morokweng.localdomain (unknown [9.85.190.209])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
 Fri, 19 Jul 2019 15:47:07 +0000 (GMT)
References: <20190718032858.28744-1-bauerman@linux.ibm.com>
 <20190718032858.28744-6-bauerman@linux.ibm.com>
 <4a07bf75-b516-c81b-da7a-4b323e6d7e52@amd.com>
 <c85ae8ff-3b7b-88bf-6b6a-c41b159c9cc2@redhat.com>
User-agent: mu4e 1.2.0; emacs 26.2
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: lijiang <lijiang@redhat.com>
Subject: Re: [PATCH v3 5/6] fs/core/vmcore: Move sev_active() reference to x86
 arch code
In-reply-to: <c85ae8ff-3b7b-88bf-6b6a-c41b159c9cc2@redhat.com>
Date: Fri, 19 Jul 2019 12:47:03 -0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
x-cbid: 19071915-0072-0000-0000-0000044B1EEB
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011457; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000287; SDB=6.01234458; UDB=6.00650541; IPR=6.01015790; 
 MB=3.00027801; MTD=3.00000008; XFM=3.00000015; UTC=2019-07-19 15:47:17
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19071915-0073-0000-0000-00004CBB738B
Message-Id: <87h87igh6w.fsf@morokweng.localdomain>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-19_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907190172
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
Cc: "Lendacky, Thomas" <Thomas.Lendacky@amd.com>,
 Mike Anderson <andmike@linux.ibm.com>, Baoquan He <bhe@redhat.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, "x86@kernel.org" <x86@kernel.org>,
 Ram Pai <linuxram@us.ibm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Alexey Dobriyan <adobriyan@gmail.com>, Halil Pasic <pasic@linux.ibm.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Hello Lianbo,

lijiang <lijiang@redhat.com> writes:

> =E5=9C=A8 2019=E5=B9=B407=E6=9C=8819=E6=97=A5 01:47, Lendacky, Thomas =E5=
=86=99=E9=81=93:
>> On 7/17/19 10:28 PM, Thiago Jung Bauermann wrote:
>>> Secure Encrypted Virtualization is an x86-specific feature, so it shoul=
dn't
>>> appear in generic kernel code because it forces non-x86 architectures to
>>> define the sev_active() function, which doesn't make a lot of sense.
>>>
>>> To solve this problem, add an x86 elfcorehdr_read() function to override
>>> the generic weak implementation. To do that, it's necessary to make
>>> read_from_oldmem() public so that it can be used outside of vmcore.c.
>>>
>>> Also, remove the export for sev_active() since it's only used in files =
that
>>> won't be built as modules.
>>>
>>> Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
>>=20
>> Adding Lianbo and Baoquan, who recently worked on this, for their review.
>>=20
>
> This change looks good to me.
>
> Reviewed-by: Lianbo Jiang <lijiang@redhat.com>

Thanks for your review!

--=20
Thiago Jung Bauermann
IBM Linux Technology Center

