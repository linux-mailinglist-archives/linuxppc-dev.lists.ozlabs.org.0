Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 14069AF8AB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2019 11:16:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Sx8v6HFzzF2Dw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2019 19:16:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=abdhalee@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Sx6v0m3lzDqCC
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2019 19:14:30 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8B96l6G078434; Wed, 11 Sep 2019 05:14:21 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2uxvddbp4f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Sep 2019 05:14:21 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x8B9AVLm009215;
 Wed, 11 Sep 2019 09:14:20 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma01wdc.us.ibm.com with ESMTP id 2uv4679wf3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Sep 2019 09:14:20 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8B9EJ9E50004364
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Sep 2019 09:14:19 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BD764AC062;
 Wed, 11 Sep 2019 09:14:19 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4CD47AC05E;
 Wed, 11 Sep 2019 09:14:17 +0000 (GMT)
Received: from [9.124.31.108] (unknown [9.124.31.108])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 11 Sep 2019 09:14:17 +0000 (GMT)
Message-ID: <1568193255.30609.14.camel@abdul.in.ibm.com>
Subject: Re: [mainline][BUG][PPC][btrfs][bisected 00801a] kernel BUG at
 fs/btrfs/locking.c:71!
From: Abdul Haleem <abdhalee@linux.vnet.ibm.com>
To: Nikolay Borisov <nborisov@suse.com>
Date: Wed, 11 Sep 2019 14:44:15 +0530
In-Reply-To: <c51e672f-c5b2-13d9-afa4-8f44a1e8580a@suse.com>
References: <1567500907.5082.12.camel@abdul>
 <7139ac07-db63-b984-c416-d1c94337c9bf@suse.com>
 <1568188807.30609.6.camel@abdul.in.ibm.com>
 <c51e672f-c5b2-13d9-afa4-8f44a1e8580a@suse.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu1 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-11_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=397 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909110088
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
Cc: sachinp <sachinp@linux.vnet.ibm.com>, josef@toxicpanda.com,
 linux-kernel <linux-kernel@vger.kernel.org>, David Sterba <dsterba@suse.com>,
 chandan <chandan@linux.vnet.ibm.com>, Brian King <brking@linux.vnet.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-btrfs@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2019-09-11 at 11:09 +0300, Nikolay Borisov wrote:
> 
> On 11.09.19 г. 11:00 ч., Abdul Haleem wrote:
> > On Tue, 2019-09-03 at 13:39 +0300, Nikolay Borisov wrote:
> >>
> 
> <split>
> 
> >> corresponds to?
> > 
> > btrfs_search_slot+0x8e8/0xb80 maps to fs/btrfs/ctree.c:2751
> >                 write_lock_level = BTRFS_MAX_LEVEL;
> 
> That doesn't make sense, presumably btrfs_search_slot+0x8e8/0xb80 should
> point at or right after the instruction which called
> btrfs_set_path_blocking. So either line 2796, 2894, 2901 or 2918 .
> 
I might be calculating to wrong address, could you please have a look on
the obj dump for files I have sent (which are less than 2MB)
> > 
> > I have sent direct message attaching vmlinux and the obj dump for
> > ctree.c and locking.c
> > 
> 
> I just got a message from : InterScan Messaging Security Suite about
> some policy being broken and no vmscan.

Sorry, my vmlinux was above 28Mb.


-- 
Regard's

Abdul Haleem
IBM Linux Technology Centre



