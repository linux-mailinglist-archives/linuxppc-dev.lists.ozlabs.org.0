Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28AAD6B9C00
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Mar 2023 17:45:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PbfXj6vj4z3cS4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Mar 2023 03:45:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Oc3hh3nT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nnac123@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Oc3hh3nT;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PbfWn38dxz30QS
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Mar 2023 03:44:51 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32EFGIuu021650
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Mar 2023 16:44:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=3QEBcPwUznOmKh9HVxll2eWQx4NcJl2ekTzejDcnnds=;
 b=Oc3hh3nTzN+FJLtda7E+jP5x5NSIQ8jyli7jJKDcGBqPtKZDfWP1lVCqj7NCQSzGx1ho
 g/Hp6MnvoHHugHe/ZaGSkdZfQQx6I3cReRXiNmI6j1rV1lC4p3RVBvVDgJMh+XjmTMWS
 K00ETHfXQ87q+8DGbFcaLtH9W08NSiaJaaOeQyhiZPEd1JZldQIAq2kBkHngM5O4h+/K
 54riLF/eLmN1qbq6aiQIoy2TrQPcJKfa6zGFj4MoMDJTqgVs4DIE8dHa4ctquK5tRreV
 fgPdNWyzaYYjEn8B0upnH4vBkI8Zh5PnhhR+p7XQZAC5Ah2NW+7Nvm1k0If1mXuwGXJF 9A== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com [169.55.85.253])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pau6m32k8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Mar 2023 16:44:49 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
	by ppma01wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32EEiQme020044
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Mar 2023 16:44:48 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([9.208.130.99])
	by ppma01wdc.us.ibm.com (PPS) with ESMTPS id 3p8h96vr5r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Mar 2023 16:44:48 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32EGil2A33948322
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Mar 2023 16:44:47 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2F7D658056;
	Tue, 14 Mar 2023 16:44:47 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BC1CB5803F;
	Tue, 14 Mar 2023 16:44:46 +0000 (GMT)
Received: from li-8d37cfcc-31b9-11b2-a85c-83226d7135c9.ibm.com.com (unknown [9.160.191.59])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 14 Mar 2023 16:44:46 +0000 (GMT)
From: Nick Child <nnac123@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH v1] powerpc: Add version to install filenames
Date: Tue, 14 Mar 2023 11:44:42 -0500
Message-Id: <20230314164442.124929-1-nnac123@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: _F-cL9MPVGyLv142f6-X3WBJpP-XscKV
X-Proofpoint-GUID: _F-cL9MPVGyLv142f6-X3WBJpP-XscKV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-14_10,2023-03-14_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 spamscore=0 suspectscore=0 impostorscore=0 mlxscore=0 clxscore=1011
 mlxlogscore=999 adultscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303140137
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
Cc: Nick Child <nnac123@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Rather than replacing the versionless vmlinux and System.map files,
copy to files with the version info appended.

Additionally, since executing the script is a last resort option,
inform the user about the missing `installkernel` command and the
location of the installation.

This work is adapted from `arch/s390/boot/install.sh`.

Signed-off-by: Nick Child <nnac123@linux.ibm.com>
---

Hoping I am not breaking someones dependency on targeting /boot/vmlinux
so RFC'ing.

I typically have kernelinstall on my LPARs and installing and rebooting
goes peacefully.

Recently, I did not have kernelinstall and `make install` seemed to behave
differently. I got very little output but a succeful return code. After
initramfs issues during boot I dug into the makefiles a bit to figure out
where execution was differing. When `kernelinstall` cannot be found, we
invoke `arch/powerpc/boot/install.sh` instead. I am primarily interested
in getting more information relayed to the user about what is going on.

The changes to installing with the version appended are more of an afterthought
that makes sense to me but could understand why someone may depend on consistent
filenames.

Opening as RFC for opinions/rejections/concerns.

Thanks!


 arch/powerpc/boot/install.sh | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/boot/install.sh b/arch/powerpc/boot/install.sh
index 461902c8a46d..101fcb397a0f 100755
--- a/arch/powerpc/boot/install.sh
+++ b/arch/powerpc/boot/install.sh
@@ -21,13 +21,17 @@ set -e
 # this should work for both the pSeries zImage and the iSeries vmlinux.sm
 image_name=`basename $2`
 
-if [ -f $4/$image_name ]; then
-	mv $4/$image_name $4/$image_name.old
+
+echo "Warning: '${INSTALLKERNEL}' command not available... Copying" \
+     "directly to $4/$image_name-$1" >&2
+
+if [ -f $4/$image_name-$1 ]; then
+	mv $4/$image_name-$1 $4/$image_name-$1.old
 fi
 
-if [ -f $4/System.map ]; then
-	mv $4/System.map $4/System.old
+if [ -f $4/System.map-$1 ]; then
+	mv $4/System.map-$1 $4/System-$1.old
 fi
 
-cat $2 > $4/$image_name
-cp $3 $4/System.map
+cat $2 > $4/$image_name-$1
+cp $3 $4/System.map-$1
-- 
2.31.1

