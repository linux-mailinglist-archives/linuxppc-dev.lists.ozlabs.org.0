Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EFEC146D9D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jan 2020 16:58:33 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 483Rl942v7zDqYL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jan 2020 02:58:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 483Rhp04XbzDqXJ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jan 2020 02:56:25 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00NFlsLm141519; Thu, 23 Jan 2020 10:56:13 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xqeeeg8kk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jan 2020 10:56:13 -0500
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 00NFoOos022344;
 Thu, 23 Jan 2020 10:56:12 -0500
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xqeeeg8jj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jan 2020 10:56:12 -0500
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 00NFtPcr031469;
 Thu, 23 Jan 2020 15:56:11 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma04wdc.us.ibm.com with ESMTP id 2xksn6y1fj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jan 2020 15:56:11 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 00NFuASY44040532
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Jan 2020 15:56:10 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D9129AE067;
 Thu, 23 Jan 2020 15:56:10 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B22F0AE063;
 Thu, 23 Jan 2020 15:56:10 +0000 (GMT)
Received: from localhost (unknown [9.85.181.148])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 23 Jan 2020 15:56:10 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Libor Pechacek <lpechacek@suse.cz>
Subject: Re: [PATCH] powerpc: drmem: avoid NULL pointer dereference when drmem
 is unavailable
In-Reply-To: <20200116102758.GC25138@fm.suse.cz>
References: <20200116102758.GC25138@fm.suse.cz>
Date: Thu, 23 Jan 2020 09:56:10 -0600
Message-ID: <87o8uudv51.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-23_08:2020-01-23,
 2020-01-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=1
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 mlxscore=0
 adultscore=0 mlxlogscore=999 phishscore=0 priorityscore=1501 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1910280000
 definitions=main-2001230129
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
Cc: David Hildenbrand <david@redhat.com>, Michal Suchanek <msuchanek@suse.cz>,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Leonardo Bras <leonardo@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev@lists.ozlabs.org, Allison Randal <allison@lohutok.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello and thanks for the patch.

Libor Pechacek <lpechacek@suse.cz> writes:
> In KVM guests drmem structure is only zero initialized. Trying to
> manipulate DLPAR parameters results in a crash in this environment.

I think this statement needs qualification. Unless I'm mistaken, this
happens only when you boot a guest without any hotpluggable memory
configured, and then try to add or remove memory.


> diff --git a/arch/powerpc/include/asm/drmem.h b/arch/powerpc/include/asm/drmem.h
> index 3d76e1c388c2..28c3d936fdf3 100644
> --- a/arch/powerpc/include/asm/drmem.h
> +++ b/arch/powerpc/include/asm/drmem.h
> @@ -27,12 +27,12 @@ struct drmem_lmb_info {
>  extern struct drmem_lmb_info *drmem_info;
>  
>  #define for_each_drmem_lmb_in_range(lmb, start, end)		\
> -	for ((lmb) = (start); (lmb) <= (end); (lmb)++)
> +	for ((lmb) = (start); (lmb) < (end); (lmb)++)
>  
>  #define for_each_drmem_lmb(lmb)					\
>  	for_each_drmem_lmb_in_range((lmb),			\
>  		&drmem_info->lmbs[0],				\
> -		&drmem_info->lmbs[drmem_info->n_lmbs - 1])
> +		&drmem_info->lmbs[drmem_info->n_lmbs])
>  
>  /*
>   * The of_drconf_cell_v1 struct defines the layout of the LMB data
> diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
> index c126b94d1943..4ea6af002e27 100644
> --- a/arch/powerpc/platforms/pseries/hotplug-memory.c
> +++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
> @@ -236,9 +236,9 @@ static int get_lmb_range(u32 drc_index, int n_lmbs,
>  	if (!start)
>  		return -EINVAL;
>  
> -	end = &start[n_lmbs - 1];
> +	end = &start[n_lmbs];
>  
> -	last_lmb = &drmem_info->lmbs[drmem_info->n_lmbs - 1];
> +	last_lmb = &drmem_info->lmbs[drmem_info->n_lmbs];
>  	if (end > last_lmb)
>  		return -EINVAL;

Is this not undefined behavior? I'd rather do this in a way that does
not involve forming out-of-bounds pointers. Even if it's safe, naming
that pointer "last_lmb" now actively hinders understanding of the code;
it should be named "limit" or something.

Anyway, I confess I've had the following patch sitting unsubmitted due
to a combination of perceived low urgency and lack of time. I've
verified it addresses your reported problem but I need a day or two to
check that it doesn't regress memory add/remove on suitably configured
guests:

================================================================

powerpc/drmem: make drmem list traversal safe on non-drmem systems

A user has reported a crash when attempting to remove an LMB on a KVM
guest where the device tree lacks the nodes and properties
(ibm,dynamic-reconfiguration-memory etc) which allow the drmem code to
support dynamic memory removal:

pseries-hotplug-mem: Attempting to hot-remove 1 LMB(s)
Unable to handle kernel paging request for data at address 0x00000010
Faulting instruction address: 0xc0000000000f0a30
Oops: Kernel access of bad area, sig: 11 [#1]
[... regs etc ...]
NIP [c0000000000f0a30] dlpar_memory+0x510/0xb50
LR [c0000000000f09e8] dlpar_memory+0x4c8/0xb50
Call Trace:
[c0000001edf97ba0] [c0000000000f09e8] dlpar_memory+0x4c8/0xb50 (unreliable)
[c0000001edf97c20] [c0000000000e8390] handle_dlpar_errorlog+0x60/0x140
[c0000001edf97c90] [c0000000000e85e0] dlpar_store+0x170/0x490
[c0000001edf97d40] [c000000000cb0c90] kobj_attr_store+0x30/0x50
[c0000001edf97d60] [c000000000591598] sysfs_kf_write+0x68/0xa0
[c0000001edf97d80] [c00000000058fec4] kernfs_fop_write+0x104/0x270
[c0000001edf97dd0] [c0000000004a1078] sys_write+0x128/0x380
[c0000001edf97e30] [c00000000000b388] system_call+0x5c/0x70

Make for_each_drmem_lmb() safe for the case where the list of drmem
LMBs is unpopulated.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>

1 file changed, 36 insertions(+), 7 deletions(-)
arch/powerpc/include/asm/drmem.h | 43 +++++++++++++++++++++++++++++++++-------

modified   arch/powerpc/include/asm/drmem.h
@@ -20,19 +20,48 @@ struct drmem_lmb {
 
 struct drmem_lmb_info {
 	struct drmem_lmb        *lmbs;
-	int                     n_lmbs;
+	unsigned int            n_lmbs;
 	u32                     lmb_size;
 };
 
 extern struct drmem_lmb_info *drmem_info;
 
-#define for_each_drmem_lmb_in_range(lmb, start, end)		\
-	for ((lmb) = (start); (lmb) <= (end); (lmb)++)
+static inline bool drmem_present(void)
+{
+	return drmem_info->lmbs != NULL;
+}
+
+static inline struct drmem_lmb *drmem_lmb_index(unsigned int index)
+{
+	if (!drmem_present())
+		return NULL;
 
-#define for_each_drmem_lmb(lmb)					\
-	for_each_drmem_lmb_in_range((lmb),			\
-		&drmem_info->lmbs[0],				\
-		&drmem_info->lmbs[drmem_info->n_lmbs - 1])
+	if (WARN_ON(index >= drmem_info->n_lmbs))
+		return NULL;
+
+	return &drmem_info->lmbs[index];
+}
+
+static inline struct drmem_lmb *drmem_first_lmb(void)
+{
+	return drmem_lmb_index(0);
+}
+
+static inline struct drmem_lmb *drmem_last_lmb(void)
+{
+	if (!drmem_present())
+		return NULL;
+
+	return drmem_lmb_index(drmem_info->n_lmbs - 1);
+}
+
+#define for_each_drmem_lmb(lmb)						\
+	for ((lmb) = drmem_first_lmb();					\
+	     (lmb) != NULL && (lmb) <= drmem_last_lmb();		\
+	     (lmb)++)
+
+#define for_each_drmem_lmb_in_range(lmb, start, end)	\
+	for ((lmb) = (start); (lmb) <= (end); (lmb)++)
 
 /*
  * The of_drconf_cell_v1 struct defines the layout of the LMB data

