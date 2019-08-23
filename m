Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A359A7EB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2019 08:59:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46FC265m00zDrQW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2019 16:59:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=bharata@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46FC0S58qczDqm6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2019 16:58:16 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7N6g06P038047
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2019 02:58:11 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2uj91dmm9n-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2019 02:58:11 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bharata@linux.ibm.com>;
 Fri, 23 Aug 2019 07:58:09 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 23 Aug 2019 07:58:07 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x7N6w5X837552392
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 23 Aug 2019 06:58:05 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4ABE45205A;
 Fri, 23 Aug 2019 06:58:05 +0000 (GMT)
Received: from in.ibm.com (unknown [9.109.246.128])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id E32195204E;
 Fri, 23 Aug 2019 06:58:01 +0000 (GMT)
Date: Fri, 23 Aug 2019 12:27:58 +0530
From: Bharata B Rao <bharata@linux.ibm.com>
To: Paul Mackerras <paulus@ozlabs.org>
Subject: Re: [PATCH v7 0/7] KVMPPC driver to manage secure guest pages
References: <20190822102620.21897-1-bharata@linux.ibm.com>
 <20190823041747.ctquda5uwvy2eiqz@oak.ozlabs.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190823041747.ctquda5uwvy2eiqz@oak.ozlabs.ibm.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-TM-AS-GCONF: 00
x-cbid: 19082306-0028-0000-0000-0000039308E9
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19082306-0029-0000-0000-000024553699
Message-Id: <20190823065758.GA29900@in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-23_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908230070
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
Reply-To: bharata@linux.ibm.com
Cc: linuxram@us.ibm.com, cclaudio@linux.ibm.com, kvm-ppc@vger.kernel.org,
 linux-mm@kvack.org, jglisse@redhat.com, aneesh.kumar@linux.vnet.ibm.com,
 paulus@au1.ibm.com, sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 hch@lst.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Aug 23, 2019 at 02:17:47PM +1000, Paul Mackerras wrote:
> On Thu, Aug 22, 2019 at 03:56:13PM +0530, Bharata B Rao wrote:
> > Hi,
> > 
> > A pseries guest can be run as a secure guest on Ultravisor-enabled
> > POWER platforms. On such platforms, this driver will be used to manage
> > the movement of guest pages between the normal memory managed by
> > hypervisor(HV) and secure memory managed by Ultravisor(UV).
> > 
> > Private ZONE_DEVICE memory equal to the amount of secure memory
> > available in the platform for running secure guests is created.
> > Whenever a page belonging to the guest becomes secure, a page from
> > this private device memory is used to represent and track that secure
> > page on the HV side. The movement of pages between normal and secure
> > memory is done via migrate_vma_pages(). The reverse movement is driven
> > via pagemap_ops.migrate_to_ram().
> > 
> > The page-in or page-out requests from UV will come to HV as hcalls and
> > HV will call back into UV via uvcalls to satisfy these page requests.
> > 
> > These patches are against hmm.git
> > (https://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.git/log/?h=hmm)
> > 
> > plus
> > 
> > Claudio Carvalho's base ultravisor enablement patchset v6
> > (https://lore.kernel.org/linuxppc-dev/20190822034838.27876-1-cclaudio@linux.ibm.com/T/#t)
> 
> How are you thinking these patches will go upstream?  Are you going to
> send them via the hmm tree?
> 
> I assume you need Claudio's patchset as a prerequisite for your series
> to compile, which means the hmm maintainers would need to pull in a
> topic branch from Michael Ellerman's powerpc tree, or something like
> that.

I was hoping that changes required from hmm.git would hit upstream soon,
will reflect in  mpe's powerpc tree at which time these patches can go
via powerpc tree along with or after Claudio's patchset.

Though this depends on migrate_vma and memremap changes that
happen to be in hmm.git, this is majorly a kvmppc change. Hence I thought
it would be appropriate for this to go via your or mpe's tree together
with required dependencies.

Regards,
Bharata.

