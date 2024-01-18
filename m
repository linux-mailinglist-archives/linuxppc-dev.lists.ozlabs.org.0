Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6A18320C2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jan 2024 22:14:52 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OBK3Uu4x;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TGFr973qDz3c58
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jan 2024 08:14:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OBK3Uu4x;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TFwJB2NWVz3bXv
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jan 2024 19:04:26 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 40I7L5Br031729;
	Thu, 18 Jan 2024 08:04:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=dW6SN3AhL0Lcxi0KIl8tKzSobcAeQPzLd4TnKFmh2CA=;
 b=OBK3Uu4xnAqt0dl7fLOvpH/dqie3h3kpd8tLlyyaLATTVcXpH3tfbUk9+5Aa7G/SkG9K
 rGke8RGRKvHW/aFLsNURz+WoPhu6p4+ZAR4f7hRro7yFdqwJQoe3DUPPpYvvR26ZYt/R
 Qg925ljlJjVAh/KroqGlufbV/gNP5L1cKnfvqs2NlZ5GAecZzrlc27e2WIU8ZjhqpTQX
 SjPlEsa1eJyZFyPTHu4YK/Nk5lErAvcvnC8hHQzhtgzR3JmMv+/iKT6ycjNjUGi6helL
 Yw1phm/qMsyUNa1osixjIXNf705SlW8gt+qgt6G7PBP5QEubARkXtE1F/fv6+PJyoTXS mA== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vpw6pvauv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jan 2024 08:04:03 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 40I7BDoX006508;
	Thu, 18 Jan 2024 08:04:03 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3vm7j21nb2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jan 2024 08:04:02 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 40I841Q036045078
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 18 Jan 2024 08:04:01 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2FADC20043;
	Thu, 18 Jan 2024 08:04:01 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F40FD20040;
	Thu, 18 Jan 2024 08:03:58 +0000 (GMT)
Received: from li-c1fdab4c-355a-11b2-a85c-ef242fe9efb4.in.ibm.com (unknown [9.109.201.126])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 18 Jan 2024 08:03:58 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: linux-kernel@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net,
        linux-xfs@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 0/3] remove duplicate ifdefs
Date: Thu, 18 Jan 2024 13:33:23 +0530
Message-Id: <20240118080326.13137-1-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: sHUTBHPs0bn-MPgVd2jK5MQVyP9-lhbG
X-Proofpoint-ORIG-GUID: sHUTBHPs0bn-MPgVd2jK5MQVyP9-lhbG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-18_04,2024-01-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 mlxlogscore=696 priorityscore=1501
 phishscore=0 adultscore=0 clxscore=1011 mlxscore=0 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2401180056
X-Mailman-Approved-At: Fri, 19 Jan 2024 08:12:35 +1100
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
Cc: peterz@infradead.org, sshegde@linux.ibm.com, mingo@kernel.org, anton@tuxera.com, chandan.babu@oracle.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When going through the code observed a case in scheduler,
where #ifdef CONFIG_SMP was used to inside an #ifdef CONFIG_SMP.
That didn't make sense since first one is good enough and second
one is a duplicate.

This could improve code readability. No functional change is intended.
Maybe this is not an issue these days as language servers can parse
the config and users can read the code without bothering about
whats true and whats not.

Does this change makes sense?

Since this might be present in other code areas wrote a very basic
python script which helps in finding these cases. It doesn't handle any
complicated #defines or space separated "# if". At some places the
log collected had to be manually corrected due to space separated ifdefs.
Thats why its not a treewide change.
There might be an opportunity for other files as well.

Logic is very simple. If there is #ifdef or #if or #ifndef add that
variable to list. Upon every subsequent #ifdef or #if or #ifndef
check if the same variable is in the list. If yes flag
an error. Verification was done manually later checking for any #undef
or any error due to script. These were the ones that flagged out and
made sense after going through code.

ifdefs were collected using grep in below way and that file was used as
the input to the script.
grep -rIwn --include="*.c*" --include="*.h"  -e "#if" -e "#ifndef" -e "#ifdef" -e "#else" -e "#endif" * > /tmp/input.txt

---------------------------------------------------------------------
script used:
---------------------------------------------------------------------
import os
import argparse

def parse_args():
    parser = argparse.ArgumentParser()
    parser.add_argument("--file",
                            help="file to input to script",
                            type=str)
    parser.add_argument("--verbose",
                            help="Print additional debugging info, 0 to disable ",
                            type=int)
    args = parser.parse_args()
    return args

def parseFiles(args):
    file_to_parse = open(args.file, "r")
    lines = file_to_parse.readlines()
    check_length = len(lines)
    ifdefs_list = []
    i=0

    while i < check_length:
        line = lines[i]
        last_word = line.strip().split(":")[2]
        last_word = last_word.split("/")[0]

        if (args.verbose):
            print(line)
        last_word_splits = last_word.split()
        if (args.verbose):
            print(last_word_splits)
        if last_word_splits[0] == "#ifdef" or last_word_splits[0] == "#ifndef" or last_word_splits[0] == "#if":
            if last_word_splits[1] in ifdefs_list:
                print("This is duplicate and may be fixed: %s, parent_list:\n" % (line))
                print(ifdefs_list)
            ifdefs_list.append(last_word_splits[1])
        if last_word_splits[0] == "#endif"":
            ifdefs_list.pop()

        i=i+1

if __name__ == "__main__":
    args = parse_args()
    parseFiles(args)
-------------------------------------------------------------------------


Shrikanth Hegde (3):
  sched: remove duplicate ifdefs
  fs: remove depulicate ifdefs
  arch/powerpc: remove duplicate ifdefs

 arch/powerpc/include/asm/paca.h           | 4 ----
 arch/powerpc/kernel/asm-offsets.c         | 2 --
 arch/powerpc/platforms/powermac/feature.c | 2 --
 arch/powerpc/xmon/xmon.c                  | 2 --
 fs/ntfs/inode.c                           | 2 --
 fs/xfs/xfs_sysfs.c                        | 4 ----
 kernel/sched/core.c                       | 4 +---
 kernel/sched/fair.c                       | 2 --
 8 files changed, 1 insertion(+), 21 deletions(-)

--
2.39.3

