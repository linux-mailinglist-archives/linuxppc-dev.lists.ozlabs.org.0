Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74EA9589D50
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Aug 2022 16:15:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lz9jj4ShLz3bhK
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Aug 2022 00:15:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=R2hEkbtF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=R2hEkbtF;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lz9hr1vMKz2xH5
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Aug 2022 00:14:35 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 274EDoVZ005170;
	Thu, 4 Aug 2022 14:14:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : content-type :
 subject : message-id : date : cc : to : mime-version; s=pp1;
 bh=MMjdrKzsO+sZhp8O4ysSVov6DWDrPqgwkLZWLcfVHI0=;
 b=R2hEkbtF8s61fJxSsSt0pWKS79C8GwTwUA/ItxLS8s6WH2SgZrvkM6+lWHfGaxnu8KI9
 yoJAJ7r8e8tXkmfAT50s+g1Ohd4FG5FJpNpaqgXmFCIdDoHKXjn+07NcMpXaf6aXQwiq
 71Ed2BYUbt0mCYaJKHCEWlRpKRh9RGkyakAH5n9urYwALtaaElwWgl56p3aWB0aOk5Qh
 rC44qin3McEv1NfO5h9Vq1tMvZH4GqcbwK4lgNQ7JXrohlEsMuMsVaDvrmwOO0aGsRc8
 YRghlHwPbMAaoJnAKIYX58o16/omv8UeZbykD33sgONJFCNjlrZo6zc5y78fnIhXU1yG tw== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hrfpmg0c8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Aug 2022 14:14:20 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 274DpmTZ031509;
	Thu, 4 Aug 2022 14:14:18 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by ppma06ams.nl.ibm.com with ESMTP id 3hmuwhx9pd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Aug 2022 14:14:17 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 274EEF3s23200128
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 4 Aug 2022 14:14:15 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7EB13A405C;
	Thu,  4 Aug 2022 14:14:15 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 01042A405B;
	Thu,  4 Aug 2022 14:14:14 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.20.48])
	by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu,  4 Aug 2022 14:14:13 +0000 (GMT)
From: Sachin Sant <sachinp@linux.ibm.com>
Content-Type: multipart/mixed;
	boundary="Apple-Mail=_F77DD4EB-DD43-432F-A9C5-D25E6ABB98D2"
Subject: [next-20220803] Build failure error: unknown type name 'nodemask_t' 
Message-Id: <828A8B57-AD26-4622-8BA1-EBAE9037B88F@linux.ibm.com>
Date: Thu, 4 Aug 2022 19:44:12 +0530
To: linuxppc-dev@lists.ozlabs.org
X-Mailer: Apple Mail (2.3696.100.31)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: RTwj7OnSRK4TDkUFKPq5RxKr9YPKHsco
X-Proofpoint-GUID: RTwj7OnSRK4TDkUFKPq5RxKr9YPKHsco
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-04_03,2022-08-04_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 spamscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 clxscore=1011 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2208040062
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
Cc: broonie@kernel.org, linux-next@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--Apple-Mail=_F77DD4EB-DD43-432F-A9C5-D25E6ABB98D2
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Linux next build (5.19.0-next-20220803) fails to build on powerpc
with following error:

In file included from ./include/linux/cred.h:16,
                 from ./include/linux/seq_file.h:13,
                 from ./arch/powerpc/include/asm/machdep.h:6,
                 from ./arch/powerpc/include/asm/archrandom.h:5,
                 from ./include/linux/random.h:109,
                 from ./include/linux/nodemask.h:97,
                 from ./include/linux/list_lru.h:12,
                 from ./include/linux/fs.h:13,
                 from ./include/linux/compat.h:17,
                 from arch/powerpc/kernel/asm-offsets.c:12:
./include/linux/sched.h:1204:2: error: unknown type name 'nodemask_t'
  nodemask_t   mems_allowed;
  ^~~~~~~~~~
In file included from ./include/linux/gfp.h:7,
                 from ./include/linux/percpu_counter.h:16,
                 from ./include/linux/sched/user.h:7,
                 from ./include/linux/cred.h:17,
                 from ./include/linux/seq_file.h:13,
                 from ./arch/powerpc/include/asm/machdep.h:6,
                 from ./arch/powerpc/include/asm/archrandom.h:5,
                 from ./include/linux/random.h:109,
                 from ./include/linux/nodemask.h:97,
                 from ./include/linux/list_lru.h:12,
                 from ./include/linux/fs.h:13,
                 from ./include/linux/compat.h:17,
                 from arch/powerpc/kernel/asm-offsets.c:12:
./include/linux/mmzone.h:1246:6: error: unknown type name 'nodemask_t'; did=
 you mean 'cpumask_t'?
      nodemask_t *nodes);
      ^~~~~~~~~~

I have attached complete failure log. next-20220802 build was good.=20=20

Git bisect points to following commit:
# git bisect bad
e50e9742515158aa30680b0a616bb5a8d049bf67 is the first bad commit
commit e50e9742515158aa30680b0a616bb5a8d049bf67

   Merge branch 'bitmap-for-next' of https://github.com/norov/linux.git

Not sure if this commit is actually the cause for build break.

I have attached .config file.

- Sachin


--Apple-Mail=_F77DD4EB-DD43-432F-A9C5-D25E6ABB98D2
Content-Disposition: attachment;
	filename=build-fail.txt
Content-Type: text/plain;
	x-unix-mode=0644;
	name="build-fail.txt"
Content-Transfer-Encoding: quoted-printable

In file included from ./include/linux/cred.h:16,
                 from ./include/linux/seq_file.h:13,
                 from ./arch/powerpc/include/asm/machdep.h:6,
                 from ./arch/powerpc/include/asm/archrandom.h:5,
                 from ./include/linux/random.h:109,
                 from ./include/linux/nodemask.h:97,
                 from ./include/linux/list_lru.h:12,
                 from ./include/linux/fs.h:13,
                 from ./include/linux/compat.h:17,
                 from arch/powerpc/kernel/asm-offsets.c:12:
./include/linux/sched.h:1204:2: error: unknown type name 'nodemask_t'
  nodemask_t   mems_allowed;
  ^~~~~~~~~~
In file included from ./include/linux/gfp.h:7,
                 from ./include/linux/percpu_counter.h:16,
                 from ./include/linux/sched/user.h:7,
                 from ./include/linux/cred.h:17,
                 from ./include/linux/seq_file.h:13,
                 from ./arch/powerpc/include/asm/machdep.h:6,
                 from ./arch/powerpc/include/asm/archrandom.h:5,
                 from ./include/linux/random.h:109,
                 from ./include/linux/nodemask.h:97,
                 from ./include/linux/list_lru.h:12,
                 from ./include/linux/fs.h:13,
                 from ./include/linux/compat.h:17,
                 from arch/powerpc/kernel/asm-offsets.c:12:
./include/linux/mmzone.h:1246:6: error: unknown type name 'nodemask_t'; =
did you mean 'cpumask_t'?
      nodemask_t *nodes);
      ^~~~~~~~~~
      cpumask_t
In file included from ./include/linux/gfp.h:7,
                 from ./include/linux/percpu_counter.h:16,
                 from ./include/linux/sched/user.h:7,
                 from ./include/linux/cred.h:17,
                 from ./include/linux/seq_file.h:13,
                 from ./arch/powerpc/include/asm/machdep.h:6,
                 from ./arch/powerpc/include/asm/archrandom.h:5,
                 from ./include/linux/random.h:109,
                 from ./include/linux/nodemask.h:97,
                 from ./include/linux/list_lru.h:12,
                 from ./include/linux/fs.h:13,
                 from ./include/linux/compat.h:17,
                 from arch/powerpc/kernel/asm-offsets.c:12:
./include/linux/mmzone.h:1265:6: error: unknown type name 'nodemask_t'; =
did you mean 'cpumask_t'?
      nodemask_t *nodes)
      ^~~~~~~~~~
      cpumask_t
./include/linux/mmzone.h:1291:6: error: unknown type name 'nodemask_t'; =
did you mean 'cpumask_t'?
      nodemask_t *nodes)
      ^~~~~~~~~~
      cpumask_t
./include/linux/mmzone.h:1334:39: error: unknown type name 'nodemask_t'; =
did you mean 'cpumask_t'?
 static inline bool movable_only_nodes(nodemask_t *nodes)
                                       ^~~~~~~~~~
                                       cpumask_t
In file included from ./include/linux/percpu_counter.h:16,
                 from ./include/linux/sched/user.h:7,
                 from ./include/linux/cred.h:17,
                 from ./include/linux/seq_file.h:13,
                 from ./arch/powerpc/include/asm/machdep.h:6,
                 from ./arch/powerpc/include/asm/archrandom.h:5,
                 from ./include/linux/random.h:109,
                 from ./include/linux/nodemask.h:97,
                 from ./include/linux/list_lru.h:12,
                 from ./include/linux/fs.h:13,
                 from ./include/linux/compat.h:17,
                 from arch/powerpc/kernel/asm-offsets.c:12:
./include/linux/gfp.h:198:3: error: unknown type name 'nodemask_t'; did =
you mean 'cpumask_t'?
   nodemask_t *nodemask);
   ^~~~~~~~~~
   cpumask_t
./include/linux/gfp.h:200:3: error: unknown type name 'nodemask_t'; did =
you mean 'cpumask_t'?
   nodemask_t *nodemask);
   ^~~~~~~~~~
   cpumask_t
./include/linux/gfp.h:203:5: error: unknown type name 'nodemask_t'; did =
you mean 'cpumask_t'?
     nodemask_t *nodemask, int nr_pages,
     ^~~~~~~~~~
     cpumask_t
./include/linux/gfp.h: In function 'alloc_pages_bulk_list':
./include/linux/gfp.h:215:9: error: implicit declaration of function =
'__alloc_pages_bulk'; did you mean 'alloc_pages_bulk_list'? =
[-Werror=3Dimplicit-function-declaration]
  return __alloc_pages_bulk(gfp, numa_mem_id(), NULL, nr_pages, list, =
NULL);
         ^~~~~~~~~~~~~~~~~~
         alloc_pages_bulk_list
In file included from ./include/linux/container_of.h:5,
                 from ./include/linux/list.h:5,
                 from ./include/linux/preempt.h:11,
                 from ./include/linux/spinlock.h:55,
                 from ./include/linux/ipc.h:5,
                 from ./include/uapi/linux/sem.h:5,
                 from ./include/linux/sem.h:5,
                 from ./include/linux/compat.h:14,
                 from arch/powerpc/kernel/asm-offsets.c:12:
./include/linux/gfp.h: In function '__alloc_pages_node':
./include/linux/gfp.h:241:45: error: implicit declaration of function =
'node_online'; did you mean 'node_zonelist'? =
[-Werror=3Dimplicit-function-declaration]
  VM_WARN_ON((gfp_mask & __GFP_THISNODE) && !node_online(nid));
                                             ^~~~~~~~~~~
./include/linux/build_bug.h:30:63: note: in definition of macro =
'BUILD_BUG_ON_INVALID'
 #define BUILD_BUG_ON_INVALID(e) ((void)(sizeof((__force long)(e))))
                                                               ^
./include/linux/gfp.h:241:2: note: in expansion of macro 'VM_WARN_ON'
  VM_WARN_ON((gfp_mask & __GFP_THISNODE) && !node_online(nid));
  ^~~~~~~~~~
In file included from ./include/linux/percpu_counter.h:16,
                 from ./include/linux/sched/user.h:7,
                 from ./include/linux/cred.h:17,
                 from ./include/linux/seq_file.h:13,
                 from ./arch/powerpc/include/asm/machdep.h:6,
                 from ./arch/powerpc/include/asm/archrandom.h:5,
                 from ./include/linux/random.h:109,
                 from ./include/linux/nodemask.h:97,
                 from ./include/linux/list_lru.h:12,
                 from ./include/linux/fs.h:13,
                 from ./include/linux/compat.h:17,
                 from arch/powerpc/kernel/asm-offsets.c:12:
./include/linux/gfp.h:243:9: error: implicit declaration of function =
'__alloc_pages'; did you mean '__add_pages'? =
[-Werror=3Dimplicit-function-declaration]
  return __alloc_pages(gfp_mask, order, nid, NULL);
         ^~~~~~~~~~~~~
         __add_pages
./include/linux/gfp.h:243:9: warning: returning 'int' from a function =
with return type 'struct page *' makes pointer from integer without a =
cast [-Wint-conversion]
  return __alloc_pages(gfp_mask, order, nid, NULL);
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/gfp.h: In function '__folio_alloc_node':
./include/linux/gfp.h:252:9: error: implicit declaration of function =
'__folio_alloc'; did you mean '__folio_alloc_node'? =
[-Werror=3Dimplicit-function-declaration]
  return __folio_alloc(gfp, order, nid, NULL);
         ^~~~~~~~~~~~~
         __folio_alloc_node
./include/linux/gfp.h:252:9: warning: returning 'int' from a function =
with return type 'struct folio *' makes pointer from integer without a =
cast [-Wint-conversion]
  return __folio_alloc(gfp, order, nid, NULL);
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/gfp.h: At top level:
./include/linux/gfp.h:366:21: error: unknown type name 'nodemask_t'; did =
you mean 'cpumask_t'?
            int nid, nodemask_t *nodemask);
                     ^~~~~~~~~~
                     cpumask_t
In file included from ./arch/powerpc/include/asm/machdep.h:6,
                 from ./arch/powerpc/include/asm/archrandom.h:5,
                 from ./include/linux/random.h:109,
                 from ./include/linux/nodemask.h:97,
                 from ./include/linux/list_lru.h:12,
                 from ./include/linux/fs.h:13,
                 from ./include/linux/compat.h:17,
                 from arch/powerpc/kernel/asm-offsets.c:12:
./include/linux/seq_file.h: In function 'seq_user_ns':
./include/linux/seq_file.h:226:18: error: dereferencing pointer to =
incomplete type 'const struct file'
  return seq->file->f_cred->user_ns;
                  ^~
In file included from ./include/linux/mm.h:703,
                 from ./include/linux/scatterlist.h:8,
                 from ./include/linux/dma-mapping.h:10,
                 from ./arch/powerpc/include/asm/machdep.h:8,
                 from ./arch/powerpc/include/asm/archrandom.h:5,
                 from ./include/linux/random.h:109,
                 from ./include/linux/nodemask.h:97,
                 from ./include/linux/list_lru.h:12,
                 from ./include/linux/fs.h:13,
                 from ./include/linux/compat.h:17,
                 from arch/powerpc/kernel/asm-offsets.c:12:
./include/linux/huge_mm.h: In function 'file_thp_enabled':
./include/linux/huge_mm.h:164:22: error: dereferencing pointer to =
incomplete type 'struct file'
  inode =3D vma->vm_file->f_inode;
                      ^~
./include/linux/huge_mm.h:168:10: error: implicit declaration of =
function 'inode_is_open_for_write' =
[-Werror=3Dimplicit-function-declaration]
         !inode_is_open_for_write(inode) && S_ISREG(inode->i_mode);
          ^~~~~~~~~~~~~~~~~~~~~~~
In file included from ./include/linux/stat.h:7,
                 from ./include/linux/compat.h:12,
                 from arch/powerpc/kernel/asm-offsets.c:12:
./include/linux/huge_mm.h:168:57: error: dereferencing pointer to =
incomplete type 'struct inode'
         !inode_is_open_for_write(inode) && S_ISREG(inode->i_mode);
                                                         ^~
./include/uapi/linux/stat.h:22:23: note: in definition of macro =
'S_ISREG'
 #define S_ISREG(m) (((m) & S_IFMT) =3D=3D S_IFREG)
                       ^
In file included from ./include/linux/scatterlist.h:8,
                 from ./include/linux/dma-mapping.h:10,
                 from ./arch/powerpc/include/asm/machdep.h:8,
                 from ./arch/powerpc/include/asm/archrandom.h:5,
                 from ./include/linux/random.h:109,
                 from ./include/linux/nodemask.h:97,
                 from ./include/linux/list_lru.h:12,
                 from ./include/linux/fs.h:13,
                 from ./include/linux/compat.h:17,
                 from arch/powerpc/kernel/asm-offsets.c:12:
./include/linux/mm.h: At top level:
./include/linux/mm.h:1772:49: error: unknown type name 'nodemask_t'; did =
you mean 'cpumask_t'?
 extern void show_free_areas(unsigned int flags, nodemask_t *nodemask);
                                                 ^~~~~~~~~~
                                                 cpumask_t
./include/linux/mm.h: In function 'get_num_physpages':
./include/linux/mm.h:2461:2: error: implicit declaration of function =
'for_each_online_node'; did you mean 'for_each_online_pgdat'? =
[-Werror=3Dimplicit-function-declaration]
  for_each_online_node(nid)
  ^~~~~~~~~~~~~~~~~~~~
  for_each_online_pgdat
./include/linux/mm.h:2461:27: error: expected ';' before 'phys_pages'
  for_each_online_node(nid)
                           ^
                           ;
   phys_pages +=3D node_present_pages(nid);
   ~~~~~~~~~~              =20
./include/linux/mm.h: At top level:
./include/linux/mm.h:2512:42: error: unknown type name 'nodemask_t'; did =
you mean 'cpumask_t'?
 extern void show_mem(unsigned int flags, nodemask_t *nodemask);
                                          ^~~~~~~~~~
                                          cpumask_t
./include/linux/mm.h:2521:33: error: unknown type name 'nodemask_t'; did =
you mean 'cpumask_t'?
 void warn_alloc(gfp_t gfp_mask, nodemask_t *nodemask, const char *fmt, =
...);
                                 ^~~~~~~~~~
                                 cpumask_t
./include/linux/mm.h: In function 'vma_is_special_huge':
./include/linux/mm.h:3273:9: error: implicit declaration of function =
'vma_is_dax'; did you mean 'vma_is_shmem'? =
[-Werror=3Dimplicit-function-declaration]
  return vma_is_dax(vma) || (vma->vm_file &&
         ^~~~~~~~~~
         vma_is_shmem
./include/linux/mm.h: In function 'seal_check_future_write':
./include/linux/mm.h:3349:14: error: 'F_SEAL_FUTURE_WRITE' undeclared =
(first use in this function); did you mean 'KEY_USR_WRITE'?
  if (seals & F_SEAL_FUTURE_WRITE) {
              ^~~~~~~~~~~~~~~~~~~
              KEY_USR_WRITE
./include/linux/mm.h:3349:14: note: each undeclared identifier is =
reported only once for each function it appears in
In file included from ./include/linux/compat.h:17,
                 from arch/powerpc/kernel/asm-offsets.c:12:
./include/linux/fs.h: At top level:
./include/linux/fs.h:2983:20: error: conflicting types for =
'inode_is_open_for_write'
 static inline bool inode_is_open_for_write(const struct inode *inode)
                    ^~~~~~~~~~~~~~~~~~~~~~~
In file included from ./include/linux/mm.h:703,
                 from ./include/linux/scatterlist.h:8,
                 from ./include/linux/dma-mapping.h:10,
                 from ./arch/powerpc/include/asm/machdep.h:8,
                 from ./arch/powerpc/include/asm/archrandom.h:5,
                 from ./include/linux/random.h:109,
                 from ./include/linux/nodemask.h:97,
                 from ./include/linux/list_lru.h:12,
                 from ./include/linux/fs.h:13,
                 from ./include/linux/compat.h:17,
                 from arch/powerpc/kernel/asm-offsets.c:12:
./include/linux/huge_mm.h:168:10: note: previous implicit declaration of =
'inode_is_open_for_write' was here
         !inode_is_open_for_write(inode) && S_ISREG(inode->i_mode);
          ^~~~~~~~~~~~~~~~~~~~~~~
In file included from ./include/linux/compat.h:17,
                 from arch/powerpc/kernel/asm-offsets.c:12:
./include/linux/fs.h:3371:20: error: conflicting types for 'vma_is_dax'
 static inline bool vma_is_dax(const struct vm_area_struct *vma)
                    ^~~~~~~~~~
In file included from ./include/linux/scatterlist.h:8,
                 from ./include/linux/dma-mapping.h:10,
                 from ./arch/powerpc/include/asm/machdep.h:8,
                 from ./arch/powerpc/include/asm/archrandom.h:5,
                 from ./include/linux/random.h:109,
                 from ./include/linux/nodemask.h:97,
                 from ./include/linux/list_lru.h:12,
                 from ./include/linux/fs.h:13,
                 from ./include/linux/compat.h:17,
                 from arch/powerpc/kernel/asm-offsets.c:12:
./include/linux/mm.h:3273:9: note: previous implicit declaration of =
'vma_is_dax' was here
  return vma_is_dax(vma) || (vma->vm_file &&
         ^~~~~~~~~~
cc1: some warnings being treated as errors
make[1]: *** [scripts/Makefile.build:118: =
arch/powerpc/kernel/asm-offsets.s] Error 1
make: *** [Makefile:1283: prepare0] Error 2

--Apple-Mail=_F77DD4EB-DD43-432F-A9C5-D25E6ABB98D2
Content-Disposition: attachment;
	filename=config.txt
Content-Type: text/plain;
	x-unix-mode=0644;
	name="config.txt"
Content-Transfer-Encoding: quoted-printable

#
# Automatically generated file; DO NOT EDIT.
# Linux/powerpc 5.19.0 Kernel Configuration
#
CONFIG_CC_VERSION_TEXT=3D"gcc (GCC) 11.3.1 20220421 (Red Hat 11.3.1-2)"
CONFIG_CC_IS_GCC=3Dy
CONFIG_GCC_VERSION=3D110301
CONFIG_CLANG_VERSION=3D0
CONFIG_AS_IS_GNU=3Dy
CONFIG_AS_VERSION=3D23502
CONFIG_LD_IS_BFD=3Dy
CONFIG_LD_VERSION=3D23502
CONFIG_LLD_VERSION=3D0
CONFIG_CC_CAN_LINK=3Dy
CONFIG_CC_CAN_LINK_STATIC=3Dy
CONFIG_CC_HAS_ASM_GOTO=3Dy
CONFIG_CC_HAS_ASM_GOTO_OUTPUT=3Dy
CONFIG_CC_HAS_ASM_GOTO_TIED_OUTPUT=3Dy
CONFIG_CC_HAS_ASM_INLINE=3Dy
CONFIG_CC_HAS_NO_PROFILE_FN_ATTR=3Dy
CONFIG_PAHOLE_VERSION=3D122
CONFIG_IRQ_WORK=3Dy
CONFIG_BUILDTIME_TABLE_SORT=3Dy
CONFIG_THREAD_INFO_IN_TASK=3Dy

#
# General setup
#
CONFIG_INIT_ENV_ARG_LIMIT=3D32
# CONFIG_COMPILE_TEST is not set
# CONFIG_WERROR is not set
CONFIG_LOCALVERSION=3D""
CONFIG_LOCALVERSION_AUTO=3Dy
CONFIG_BUILD_SALT=3D""
CONFIG_HAVE_KERNEL_GZIP=3Dy
CONFIG_HAVE_KERNEL_XZ=3Dy
CONFIG_KERNEL_GZIP=3Dy
# CONFIG_KERNEL_XZ is not set
CONFIG_DEFAULT_INIT=3D""
CONFIG_DEFAULT_HOSTNAME=3D"(none)"
CONFIG_SYSVIPC=3Dy
CONFIG_SYSVIPC_SYSCTL=3Dy
CONFIG_SYSVIPC_COMPAT=3Dy
CONFIG_POSIX_MQUEUE=3Dy
CONFIG_POSIX_MQUEUE_SYSCTL=3Dy
# CONFIG_WATCH_QUEUE is not set
CONFIG_CROSS_MEMORY_ATTACH=3Dy
# CONFIG_USELIB is not set
CONFIG_AUDIT=3Dy
CONFIG_HAVE_ARCH_AUDITSYSCALL=3Dy
CONFIG_AUDITSYSCALL=3Dy

#
# IRQ subsystem
#
CONFIG_GENERIC_IRQ_SHOW=3Dy
CONFIG_GENERIC_IRQ_SHOW_LEVEL=3Dy
CONFIG_GENERIC_IRQ_MIGRATION=3Dy
CONFIG_GENERIC_IRQ_INJECTION=3Dy
CONFIG_HARDIRQS_SW_RESEND=3Dy
CONFIG_IRQ_DOMAIN=3Dy
CONFIG_IRQ_DOMAIN_HIERARCHY=3Dy
CONFIG_GENERIC_MSI_IRQ=3Dy
CONFIG_GENERIC_MSI_IRQ_DOMAIN=3Dy
CONFIG_IRQ_FORCED_THREADING=3Dy
CONFIG_SPARSE_IRQ=3Dy
# CONFIG_GENERIC_IRQ_DEBUGFS is not set
# end of IRQ subsystem

CONFIG_GENERIC_TIME_VSYSCALL=3Dy
CONFIG_GENERIC_CLOCKEVENTS=3Dy
CONFIG_ARCH_HAS_TICK_BROADCAST=3Dy
CONFIG_GENERIC_CLOCKEVENTS_BROADCAST=3Dy
CONFIG_GENERIC_CMOS_UPDATE=3Dy
CONFIG_TIME_KUNIT_TEST=3Dm
CONFIG_CONTEXT_TRACKING=3Dy
CONFIG_CONTEXT_TRACKING_IDLE=3Dy

#
# Timers subsystem
#
CONFIG_TICK_ONESHOT=3Dy
CONFIG_NO_HZ_COMMON=3Dy
# CONFIG_HZ_PERIODIC is not set
# CONFIG_NO_HZ_IDLE is not set
CONFIG_NO_HZ_FULL=3Dy
CONFIG_CONTEXT_TRACKING_USER=3Dy
# CONFIG_CONTEXT_TRACKING_USER_FORCE is not set
CONFIG_NO_HZ=3Dy
CONFIG_HIGH_RES_TIMERS=3Dy
# end of Timers subsystem

CONFIG_BPF=3Dy
CONFIG_HAVE_EBPF_JIT=3Dy

#
# BPF subsystem
#
CONFIG_BPF_SYSCALL=3Dy
CONFIG_BPF_JIT=3Dy
CONFIG_BPF_JIT_ALWAYS_ON=3Dy
CONFIG_BPF_JIT_DEFAULT_ON=3Dy
CONFIG_BPF_UNPRIV_DEFAULT_OFF=3Dy
# CONFIG_BPF_PRELOAD is not set
# CONFIG_BPF_LSM is not set
# end of BPF subsystem

CONFIG_PREEMPT_VOLUNTARY_BUILD=3Dy
# CONFIG_PREEMPT_NONE is not set
CONFIG_PREEMPT_VOLUNTARY=3Dy
# CONFIG_PREEMPT is not set
CONFIG_SCHED_CORE=3Dy

#
# CPU/Task time and stats accounting
#
CONFIG_VIRT_CPU_ACCOUNTING=3Dy
CONFIG_VIRT_CPU_ACCOUNTING_GEN=3Dy
# CONFIG_IRQ_TIME_ACCOUNTING is not set
CONFIG_BSD_PROCESS_ACCT=3Dy
CONFIG_BSD_PROCESS_ACCT_V3=3Dy
CONFIG_TASKSTATS=3Dy
CONFIG_TASK_DELAY_ACCT=3Dy
CONFIG_TASK_XACCT=3Dy
CONFIG_TASK_IO_ACCOUNTING=3Dy
CONFIG_PSI=3Dy
CONFIG_PSI_DEFAULT_DISABLED=3Dy
# end of CPU/Task time and stats accounting

CONFIG_CPU_ISOLATION=3Dy

#
# RCU Subsystem
#
CONFIG_TREE_RCU=3Dy
# CONFIG_RCU_EXPERT is not set
CONFIG_SRCU=3Dy
CONFIG_TREE_SRCU=3Dy
CONFIG_TASKS_RCU_GENERIC=3Dy
CONFIG_TASKS_RUDE_RCU=3Dy
CONFIG_TASKS_TRACE_RCU=3Dy
CONFIG_RCU_STALL_COMMON=3Dy
CONFIG_RCU_NEED_SEGCBLIST=3Dy
CONFIG_RCU_NOCB_CPU=3Dy
# CONFIG_RCU_NOCB_CPU_DEFAULT_ALL is not set
# end of RCU Subsystem

# CONFIG_IKCONFIG is not set
CONFIG_IKHEADERS=3Dm
CONFIG_LOG_BUF_SHIFT=3D20
CONFIG_LOG_CPU_MAX_BUF_SHIFT=3D12
CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=3D13
# CONFIG_PRINTK_INDEX is not set

#
# Scheduler features
#
# CONFIG_UCLAMP_TASK is not set
# end of Scheduler features

CONFIG_ARCH_SUPPORTS_NUMA_BALANCING=3Dy
CONFIG_CC_HAS_INT128=3Dy
CONFIG_CC_IMPLICIT_FALLTHROUGH=3D"-Wimplicit-fallthrough=3D5"
CONFIG_GCC12_NO_ARRAY_BOUNDS=3Dy
CONFIG_NUMA_BALANCING=3Dy
CONFIG_NUMA_BALANCING_DEFAULT_ENABLED=3Dy
CONFIG_CGROUPS=3Dy
CONFIG_PAGE_COUNTER=3Dy
# CONFIG_CGROUP_FAVOR_DYNMODS is not set
CONFIG_MEMCG=3Dy
CONFIG_MEMCG_SWAP=3Dy
CONFIG_MEMCG_KMEM=3Dy
CONFIG_BLK_CGROUP=3Dy
CONFIG_CGROUP_WRITEBACK=3Dy
CONFIG_CGROUP_SCHED=3Dy
CONFIG_FAIR_GROUP_SCHED=3Dy
CONFIG_CFS_BANDWIDTH=3Dy
CONFIG_RT_GROUP_SCHED=3Dy
CONFIG_CGROUP_PIDS=3Dy
CONFIG_CGROUP_RDMA=3Dy
CONFIG_CGROUP_FREEZER=3Dy
CONFIG_CGROUP_HUGETLB=3Dy
CONFIG_CPUSETS=3Dy
CONFIG_PROC_PID_CPUSET=3Dy
CONFIG_CGROUP_DEVICE=3Dy
CONFIG_CGROUP_CPUACCT=3Dy
CONFIG_CGROUP_PERF=3Dy
CONFIG_CGROUP_BPF=3Dy
CONFIG_CGROUP_MISC=3Dy
# CONFIG_CGROUP_DEBUG is not set
CONFIG_SOCK_CGROUP_DATA=3Dy
CONFIG_NAMESPACES=3Dy
CONFIG_UTS_NS=3Dy
CONFIG_TIME_NS=3Dy
CONFIG_IPC_NS=3Dy
CONFIG_USER_NS=3Dy
CONFIG_PID_NS=3Dy
CONFIG_NET_NS=3Dy
CONFIG_CHECKPOINT_RESTORE=3Dy
CONFIG_SCHED_AUTOGROUP=3Dy
# CONFIG_SYSFS_DEPRECATED is not set
CONFIG_RELAY=3Dy
CONFIG_BLK_DEV_INITRD=3Dy
CONFIG_INITRAMFS_SOURCE=3D""
CONFIG_RD_GZIP=3Dy
CONFIG_RD_BZIP2=3Dy
CONFIG_RD_LZMA=3Dy
CONFIG_RD_XZ=3Dy
CONFIG_RD_LZO=3Dy
CONFIG_RD_LZ4=3Dy
CONFIG_RD_ZSTD=3Dy
# CONFIG_BOOT_CONFIG is not set
CONFIG_INITRAMFS_PRESERVE_MTIME=3Dy
CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=3Dy
# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
CONFIG_HAVE_LD_DEAD_CODE_DATA_ELIMINATION=3Dy
CONFIG_LD_ORPHAN_WARN=3Dy
CONFIG_SYSCTL=3Dy
CONFIG_SYSCTL_EXCEPTION_TRACE=3Dy
CONFIG_HAVE_PCSPKR_PLATFORM=3Dy
# CONFIG_EXPERT is not set
CONFIG_MULTIUSER=3Dy
CONFIG_SGETMASK_SYSCALL=3Dy
CONFIG_SYSFS_SYSCALL=3Dy
CONFIG_FHANDLE=3Dy
CONFIG_POSIX_TIMERS=3Dy
CONFIG_PRINTK=3Dy
CONFIG_BUG=3Dy
CONFIG_ELF_CORE=3Dy
CONFIG_PCSPKR_PLATFORM=3Dy
CONFIG_BASE_FULL=3Dy
CONFIG_FUTEX=3Dy
CONFIG_FUTEX_PI=3Dy
CONFIG_EPOLL=3Dy
CONFIG_SIGNALFD=3Dy
CONFIG_TIMERFD=3Dy
CONFIG_EVENTFD=3Dy
CONFIG_SHMEM=3Dy
CONFIG_AIO=3Dy
CONFIG_IO_URING=3Dy
CONFIG_ADVISE_SYSCALLS=3Dy
CONFIG_MEMBARRIER=3Dy
CONFIG_KALLSYMS=3Dy
CONFIG_KALLSYMS_ALL=3Dy
CONFIG_KALLSYMS_BASE_RELATIVE=3Dy
CONFIG_ARCH_HAS_MEMBARRIER_CALLBACKS=3Dy
CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE=3Dy
CONFIG_KCMP=3Dy
CONFIG_RSEQ=3Dy
# CONFIG_EMBEDDED is not set
CONFIG_HAVE_PERF_EVENTS=3Dy

#
# Kernel Performance Events And Counters
#
CONFIG_PERF_EVENTS=3Dy
# end of Kernel Performance Events And Counters

CONFIG_SYSTEM_DATA_VERIFICATION=3Dy
CONFIG_PROFILING=3Dy
CONFIG_TRACEPOINTS=3Dy
# end of General setup

CONFIG_PPC64=3Dy

#
# Processor support
#
CONFIG_PPC_BOOK3S_64=3Dy
# CONFIG_PPC_BOOK3E_64 is not set
CONFIG_GENERIC_CPU=3Dy
# CONFIG_POWER7_CPU is not set
# CONFIG_POWER8_CPU is not set
# CONFIG_POWER9_CPU is not set
CONFIG_PPC_BOOK3S=3Dy
CONFIG_PPC_FPU_REGS=3Dy
CONFIG_PPC_FPU=3Dy
CONFIG_ALTIVEC=3Dy
CONFIG_VSX=3Dy
CONFIG_PPC_64S_HASH_MMU=3Dy
CONFIG_PPC_RADIX_MMU=3Dy
CONFIG_PPC_RADIX_MMU_DEFAULT=3Dy
CONFIG_PPC_KUEP=3Dy
CONFIG_PPC_KUAP=3Dy
CONFIG_PPC_KUAP_DEBUG=3Dy
CONFIG_PPC_PKEY=3Dy
CONFIG_PPC_HAVE_PMU_SUPPORT=3Dy
CONFIG_PMU_SYSFS=3Dy
CONFIG_PPC_PERF_CTRS=3Dy
CONFIG_FORCE_SMP=3Dy
CONFIG_SMP=3Dy
CONFIG_NR_CPUS=3D2048
CONFIG_PPC_DOORBELL=3Dy
# end of Processor support

CONFIG_VDSO32=3Dy
# CONFIG_CPU_BIG_ENDIAN is not set
CONFIG_CPU_LITTLE_ENDIAN=3Dy
CONFIG_PPC64_ELF_ABI_V2=3Dy
CONFIG_PPC64_BOOT_WRAPPER=3Dy
CONFIG_64BIT=3Dy
CONFIG_LIVEPATCH_64=3Dy
CONFIG_MMU=3Dy
CONFIG_ARCH_MMAP_RND_BITS_MAX=3D29
CONFIG_ARCH_MMAP_RND_BITS_MIN=3D14
CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=3D13
CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MIN=3D7
CONFIG_NR_IRQS=3D512
CONFIG_NMI_IPI=3Dy
CONFIG_PPC_WATCHDOG=3Dy
CONFIG_STACKTRACE_SUPPORT=3Dy
CONFIG_LOCKDEP_SUPPORT=3Dy
CONFIG_GENERIC_HWEIGHT=3Dy
CONFIG_PPC=3Dy
CONFIG_PPC_LONG_DOUBLE_128=3Dy
CONFIG_PPC_BARRIER_NOSPEC=3Dy
CONFIG_EARLY_PRINTK=3Dy
CONFIG_PANIC_TIMEOUT=3D180
CONFIG_COMPAT=3Dy
CONFIG_SCHED_OMIT_FRAME_POINTER=3Dy
CONFIG_ARCH_MAY_HAVE_PC_FDC=3Dy
CONFIG_PPC_UDBG_16550=3Dy
CONFIG_AUDIT_ARCH=3Dy
CONFIG_GENERIC_BUG=3Dy
CONFIG_GENERIC_BUG_RELATIVE_POINTERS=3Dy
CONFIG_EPAPR_BOOT=3Dy
CONFIG_ARCH_HIBERNATION_POSSIBLE=3Dy
CONFIG_ARCH_SUSPEND_POSSIBLE=3Dy
CONFIG_ARCH_SUSPEND_NONZERO_CPU=3Dy
CONFIG_ARCH_HAS_ADD_PAGES=3Dy
CONFIG_ARCH_SUPPORTS_UPROBES=3Dy
CONFIG_PPC_DAWR=3Dy
CONFIG_PGTABLE_LEVELS=3D4
CONFIG_PPC_MSI_BITMAP=3Dy
CONFIG_PPC_XICS=3Dy
CONFIG_PPC_ICP_NATIVE=3Dy
CONFIG_PPC_ICP_HV=3Dy
CONFIG_PPC_ICS_RTAS=3Dy
CONFIG_PPC_XIVE=3Dy
CONFIG_PPC_XIVE_NATIVE=3Dy
CONFIG_PPC_XIVE_SPAPR=3Dy

#
# Platform support
#
CONFIG_PPC_POWERNV=3Dy
CONFIG_OPAL_PRD=3Dm
# CONFIG_PPC_MEMTRACE is not set
CONFIG_SCOM_DEBUGFS=3Dy
CONFIG_PPC_PSERIES=3Dy
CONFIG_PARAVIRT_SPINLOCKS=3Dy
CONFIG_PPC_SPLPAR=3Dy
CONFIG_DTL=3Dy
CONFIG_PSERIES_ENERGY=3Dm
CONFIG_IO_EVENT_IRQ=3Dy
CONFIG_LPARCFG=3Dy
CONFIG_PPC_SMLPAR=3Dy
CONFIG_CMM=3Dy
CONFIG_HV_PERF_CTRS=3Dy
CONFIG_IBMVIO=3Dy
# CONFIG_PSERIES_PLPKS is not set
CONFIG_PAPR_SCM=3Dm
CONFIG_PPC_SVM=3Dy
CONFIG_PPC_VAS=3Dy
CONFIG_KVM_GUEST=3Dy
CONFIG_EPAPR_PARAVIRT=3Dy
CONFIG_PPC_HASH_MMU_NATIVE=3Dy
CONFIG_PPC_OF_BOOT_TRAMPOLINE=3Dy
CONFIG_PPC_DT_CPU_FTRS=3Dy
CONFIG_UDBG_RTAS_CONSOLE=3Dy
CONFIG_PPC_SMP_MUXED_IPI=3Dy
CONFIG_MPIC=3Dy
# CONFIG_MPIC_MSGR is not set
CONFIG_PPC_I8259=3Dy
CONFIG_PPC_RTAS=3Dy
CONFIG_RTAS_ERROR_LOGGING=3Dy
CONFIG_PPC_RTAS_DAEMON=3Dy
CONFIG_RTAS_PROC=3Dy
CONFIG_RTAS_FLASH=3Dy
CONFIG_EEH=3Dy
CONFIG_PPC_P7_NAP=3Dy
CONFIG_PPC_BOOK3S_IDLE=3Dy
CONFIG_PPC_INDIRECT_PIO=3Dy

#
# CPU Frequency scaling
#
CONFIG_CPU_FREQ=3Dy
CONFIG_CPU_FREQ_GOV_ATTR_SET=3Dy
CONFIG_CPU_FREQ_GOV_COMMON=3Dy
CONFIG_CPU_FREQ_STAT=3Dy
CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE=3Dy
# CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL is not set
CONFIG_CPU_FREQ_GOV_PERFORMANCE=3Dy
CONFIG_CPU_FREQ_GOV_POWERSAVE=3Dy
CONFIG_CPU_FREQ_GOV_USERSPACE=3Dy
CONFIG_CPU_FREQ_GOV_ONDEMAND=3Dy
CONFIG_CPU_FREQ_GOV_CONSERVATIVE=3Dy
CONFIG_CPU_FREQ_GOV_SCHEDUTIL=3Dy

#
# CPU frequency scaling drivers
#
CONFIG_POWERNV_CPUFREQ=3Dy
# end of CPU Frequency scaling

#
# CPUIdle driver
#

#
# CPU Idle
#
CONFIG_CPU_IDLE=3Dy
# CONFIG_CPU_IDLE_GOV_LADDER is not set
CONFIG_CPU_IDLE_GOV_MENU=3Dy
# CONFIG_CPU_IDLE_GOV_TEO is not set
CONFIG_CPU_IDLE_GOV_HALTPOLL=3Dy

#
# POWERPC CPU Idle Drivers
#
CONFIG_PSERIES_CPUIDLE=3Dy
CONFIG_POWERNV_CPUIDLE=3Dy
# end of POWERPC CPU Idle Drivers
# end of CPU Idle
# end of CPUIdle driver

# CONFIG_GEN_RTC is not set
# end of Platform support

#
# Kernel options
#
CONFIG_HZ_100=3Dy
# CONFIG_HZ_250 is not set
# CONFIG_HZ_300 is not set
# CONFIG_HZ_1000 is not set
CONFIG_HZ=3D100
CONFIG_SCHED_HRTICK=3Dy
CONFIG_PPC_TRANSACTIONAL_MEM=3Dy
CONFIG_PPC_UV=3Dy
CONFIG_MPROFILE_KERNEL=3Dy
CONFIG_HOTPLUG_CPU=3Dy
CONFIG_PPC_QUEUED_SPINLOCKS=3Dy
CONFIG_ARCH_CPU_PROBE_RELEASE=3Dy
CONFIG_PPC64_SUPPORTS_MEMORY_FAILURE=3Dy
CONFIG_KEXEC=3Dy
CONFIG_KEXEC_FILE=3Dy
CONFIG_ARCH_HAS_KEXEC_PURGATORY=3Dy
CONFIG_RELOCATABLE=3Dy
# CONFIG_RELOCATABLE_TEST is not set
CONFIG_CRASH_DUMP=3Dy
CONFIG_FA_DUMP=3Dy
CONFIG_OPAL_CORE=3Dy
CONFIG_IRQ_ALL_CPUS=3Dy
CONFIG_NUMA=3Dy
CONFIG_NODES_SHIFT=3D8
CONFIG_HAVE_MEMORYLESS_NODES=3Dy
CONFIG_ARCH_SELECT_MEMORY_MODEL=3Dy
CONFIG_ARCH_SPARSEMEM_ENABLE=3Dy
CONFIG_ARCH_SPARSEMEM_DEFAULT=3Dy
CONFIG_ILLEGAL_POINTER_VALUE=3D0x5deadbeef0000000
CONFIG_ARCH_MEMORY_PROBE=3Dy
# CONFIG_PPC_4K_PAGES is not set
CONFIG_PPC_64K_PAGES=3Dy
CONFIG_PAGE_SIZE_64KB=3Dy
CONFIG_PPC_PAGE_SHIFT=3D16
CONFIG_THREAD_SHIFT=3D14
CONFIG_DATA_SHIFT=3D24
CONFIG_FORCE_MAX_ZONEORDER=3D9
CONFIG_PPC_SUBPAGE_PROT=3Dy
CONFIG_PPC_PROT_SAO_LPAR=3Dy
CONFIG_PPC_COPRO_BASE=3Dy
CONFIG_SCHED_SMT=3Dy
CONFIG_PPC_DENORMALISATION=3Dy
CONFIG_CMDLINE=3D""
CONFIG_EXTRA_TARGETS=3D""
CONFIG_SUSPEND=3Dy
CONFIG_SUSPEND_FREEZER=3Dy
# CONFIG_HIBERNATION is not set
CONFIG_PM_SLEEP=3Dy
CONFIG_PM_SLEEP_SMP=3Dy
CONFIG_PM_SLEEP_SMP_NONZERO_CPU=3Dy
# CONFIG_PM_AUTOSLEEP is not set
# CONFIG_PM_USERSPACE_AUTOSLEEP is not set
# CONFIG_PM_WAKELOCKS is not set
CONFIG_PM=3Dy
CONFIG_PM_DEBUG=3Dy
# CONFIG_PM_ADVANCED_DEBUG is not set
# CONFIG_PM_TEST_SUSPEND is not set
CONFIG_PM_SLEEP_DEBUG=3Dy
CONFIG_PM_GENERIC_DOMAINS=3Dy
# CONFIG_WQ_POWER_EFFICIENT_DEFAULT is not set
CONFIG_PM_GENERIC_DOMAINS_SLEEP=3Dy
CONFIG_PM_GENERIC_DOMAINS_OF=3Dy
# CONFIG_ENERGY_MODEL is not set
CONFIG_PPC_MEM_KEYS=3Dy
CONFIG_PPC_SECURE_BOOT=3Dy
CONFIG_PPC_SECVAR_SYSFS=3Dy
CONFIG_PPC_RTAS_FILTER=3Dy
# end of Kernel options

CONFIG_ISA_DMA_API=3Dy

#
# Bus options
#
CONFIG_GENERIC_ISA_DMA=3Dy
# CONFIG_FSL_LBC is not set
# end of Bus options

CONFIG_NONSTATIC_KERNEL=3Dy
CONFIG_PAGE_OFFSET=3D0xc000000000000000
CONFIG_KERNEL_START=3D0xc000000000000000
CONFIG_PHYSICAL_START=3D0x00000000
CONFIG_HAVE_KVM_IRQCHIP=3Dy
CONFIG_HAVE_KVM_IRQFD=3Dy
CONFIG_HAVE_KVM_EVENTFD=3Dy
CONFIG_KVM_VFIO=3Dy
CONFIG_KVM_COMPAT=3Dy
CONFIG_HAVE_KVM_IRQ_BYPASS=3Dy
CONFIG_HAVE_KVM_VCPU_ASYNC_IOCTL=3Dy
CONFIG_VIRTUALIZATION=3Dy
CONFIG_KVM=3Dy
CONFIG_KVM_BOOK3S_HANDLER=3Dy
CONFIG_KVM_BOOK3S_64_HANDLER=3Dy
CONFIG_KVM_BOOK3S_HV_POSSIBLE=3Dy
CONFIG_KVM_BOOK3S_64=3Dm
CONFIG_KVM_BOOK3S_64_HV=3Dm
# CONFIG_KVM_BOOK3S_64_PR is not set
# CONFIG_KVM_BOOK3S_HV_P9_TIMING is not set
# CONFIG_KVM_BOOK3S_HV_P8_TIMING is not set
CONFIG_KVM_BOOK3S_HV_NESTED_PMU_WORKAROUND=3Dy
CONFIG_KVM_XICS=3Dy
CONFIG_KVM_XIVE=3Dy
CONFIG_HAVE_LIVEPATCH=3Dy
CONFIG_LIVEPATCH=3Dy

#
# General architecture-dependent options
#
CONFIG_CRASH_CORE=3Dy
CONFIG_KEXEC_CORE=3Dy
CONFIG_KEXEC_ELF=3Dy
CONFIG_HAVE_IMA_KEXEC=3Dy
CONFIG_KPROBES=3Dy
CONFIG_JUMP_LABEL=3Dy
CONFIG_STATIC_KEYS_SELFTEST=3Dy
CONFIG_OPTPROBES=3Dy
CONFIG_KPROBES_ON_FTRACE=3Dy
CONFIG_UPROBES=3Dy
CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=3Dy
CONFIG_ARCH_USE_BUILTIN_BSWAP=3Dy
CONFIG_KRETPROBES=3Dy
CONFIG_HAVE_IOREMAP_PROT=3Dy
CONFIG_HAVE_KPROBES=3Dy
CONFIG_HAVE_KRETPROBES=3Dy
CONFIG_HAVE_OPTPROBES=3Dy
CONFIG_HAVE_KPROBES_ON_FTRACE=3Dy
CONFIG_HAVE_FUNCTION_ERROR_INJECTION=3Dy
CONFIG_HAVE_NMI=3Dy
CONFIG_TRACE_IRQFLAGS_SUPPORT=3Dy
CONFIG_HAVE_ARCH_TRACEHOOK=3Dy
CONFIG_GENERIC_SMP_IDLE_THREAD=3Dy
CONFIG_ARCH_HAS_FORTIFY_SOURCE=3Dy
CONFIG_ARCH_HAS_SET_MEMORY=3Dy
CONFIG_ARCH_WANTS_NO_INSTR=3Dy
CONFIG_HAVE_ASM_MODVERSIONS=3Dy
CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=3Dy
CONFIG_HAVE_RSEQ=3Dy
CONFIG_HAVE_RUST=3Dy
CONFIG_HAVE_HW_BREAKPOINT=3Dy
CONFIG_HAVE_PERF_EVENTS_NMI=3Dy
CONFIG_HAVE_NMI_WATCHDOG=3Dy
CONFIG_HAVE_HARDLOCKUP_DETECTOR_ARCH=3Dy
CONFIG_HAVE_PERF_REGS=3Dy
CONFIG_HAVE_PERF_USER_STACK_DUMP=3Dy
CONFIG_HAVE_ARCH_JUMP_LABEL=3Dy
CONFIG_HAVE_ARCH_JUMP_LABEL_RELATIVE=3Dy
CONFIG_MMU_GATHER_TABLE_FREE=3Dy
CONFIG_MMU_GATHER_RCU_TABLE_FREE=3Dy
CONFIG_MMU_GATHER_PAGE_SIZE=3Dy
CONFIG_MMU_GATHER_MERGE_VMAS=3Dy
CONFIG_ARCH_WANT_IRQS_OFF_ACTIVATE_MM=3Dy
CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=3Dy
CONFIG_ARCH_WEAK_RELEASE_ACQUIRE=3Dy
CONFIG_ARCH_WANT_IPC_PARSE_VERSION=3Dy
CONFIG_ARCH_WANT_COMPAT_IPC_PARSE_VERSION=3Dy
CONFIG_ARCH_WANT_OLD_COMPAT_IPC=3Dy
CONFIG_HAVE_ARCH_SECCOMP=3Dy
CONFIG_HAVE_ARCH_SECCOMP_FILTER=3Dy
CONFIG_SECCOMP=3Dy
CONFIG_SECCOMP_FILTER=3Dy
# CONFIG_SECCOMP_CACHE_DEBUG is not set
CONFIG_HAVE_STACKPROTECTOR=3Dy
CONFIG_STACKPROTECTOR=3Dy
CONFIG_STACKPROTECTOR_STRONG=3Dy
CONFIG_LTO_NONE=3Dy
CONFIG_HAVE_CONTEXT_TRACKING_USER=3Dy
CONFIG_HAVE_VIRT_CPU_ACCOUNTING=3Dy
CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=3Dy
CONFIG_HAVE_IRQ_TIME_ACCOUNTING=3Dy
CONFIG_HAVE_MOVE_PUD=3Dy
CONFIG_HAVE_MOVE_PMD=3Dy
CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=3Dy
CONFIG_HAVE_ARCH_HUGE_VMAP=3Dy
CONFIG_HAVE_ARCH_HUGE_VMALLOC=3Dy
CONFIG_HAVE_ARCH_SOFT_DIRTY=3Dy
CONFIG_HAVE_MOD_ARCH_SPECIFIC=3Dy
CONFIG_MODULES_USE_ELF_RELA=3Dy
CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK=3Dy
CONFIG_ARCH_HAS_ELF_RANDOMIZE=3Dy
CONFIG_HAVE_ARCH_MMAP_RND_BITS=3Dy
CONFIG_ARCH_MMAP_RND_BITS=3D14
CONFIG_HAVE_ARCH_MMAP_RND_COMPAT_BITS=3Dy
CONFIG_ARCH_MMAP_RND_COMPAT_BITS=3D7
CONFIG_PAGE_SIZE_LESS_THAN_256KB=3Dy
CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT=3Dy
CONFIG_HAVE_RELIABLE_STACKTRACE=3Dy
CONFIG_HAVE_ARCH_NVRAM_OPS=3Dy
CONFIG_CLONE_BACKWARDS=3Dy
CONFIG_OLD_SIGSUSPEND=3Dy
CONFIG_COMPAT_OLD_SIGACTION=3Dy
CONFIG_COMPAT_32BIT_TIME=3Dy
CONFIG_HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET=3Dy
CONFIG_RANDOMIZE_KSTACK_OFFSET=3Dy
# CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT is not set
CONFIG_ARCH_OPTIONAL_KERNEL_RWX=3Dy
CONFIG_ARCH_OPTIONAL_KERNEL_RWX_DEFAULT=3Dy
CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=3Dy
CONFIG_STRICT_KERNEL_RWX=3Dy
CONFIG_ARCH_HAS_STRICT_MODULE_RWX=3Dy
CONFIG_STRICT_MODULE_RWX=3Dy
CONFIG_ARCH_HAS_PHYS_TO_DMA=3Dy
# CONFIG_LOCK_EVENT_COUNTS is not set
CONFIG_ARCH_HAS_MEM_ENCRYPT=3Dy
CONFIG_ARCH_HAS_CC_PLATFORM=3Dy
CONFIG_ARCH_WANT_LD_ORPHAN_WARN=3Dy
CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=3Dy

#
# GCOV-based kernel profiling
#
# CONFIG_GCOV_KERNEL is not set
CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=3Dy
# end of GCOV-based kernel profiling

CONFIG_HAVE_GCC_PLUGINS=3Dy
CONFIG_GCC_PLUGINS=3Dy
# CONFIG_GCC_PLUGIN_LATENT_ENTROPY is not set
# end of General architecture-dependent options

CONFIG_RT_MUTEXES=3Dy
CONFIG_BASE_SMALL=3D0
CONFIG_MODULE_SIG_FORMAT=3Dy
CONFIG_MODULES=3Dy
CONFIG_MODULE_FORCE_LOAD=3Dy
CONFIG_MODULE_UNLOAD=3Dy
# CONFIG_MODULE_FORCE_UNLOAD is not set
# CONFIG_MODULE_UNLOAD_TAINT_TRACKING is not set
CONFIG_MODVERSIONS=3Dy
CONFIG_ASM_MODVERSIONS=3Dy
CONFIG_MODULE_SRCVERSION_ALL=3Dy
# CONFIG_MODULE_SIG is not set
# CONFIG_MODULE_SIG_ALL is not set
# CONFIG_MODULE_SIG_SHA1 is not set
# CONFIG_MODULE_SIG_SHA224 is not set
CONFIG_MODULE_SIG_SHA256=3Dy
# CONFIG_MODULE_SIG_SHA384 is not set
# CONFIG_MODULE_SIG_SHA512 is not set
CONFIG_MODULE_SIG_HASH=3D"sha256"
CONFIG_MODULE_COMPRESS_NONE=3Dy
# CONFIG_MODULE_COMPRESS_GZIP is not set
# CONFIG_MODULE_COMPRESS_XZ is not set
# CONFIG_MODULE_COMPRESS_ZSTD is not set
# CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS is not set
CONFIG_MODPROBE_PATH=3D"/sbin/modprobe"
CONFIG_MODULES_TREE_LOOKUP=3Dy
CONFIG_BLOCK=3Dy
CONFIG_BLOCK_LEGACY_AUTOLOAD=3Dy
CONFIG_BLK_CGROUP_RWSTAT=3Dy
CONFIG_BLK_DEV_BSG_COMMON=3Dy
CONFIG_BLK_ICQ=3Dy
CONFIG_BLK_DEV_BSGLIB=3Dy
CONFIG_BLK_DEV_INTEGRITY=3Dy
CONFIG_BLK_DEV_INTEGRITY_T10=3Dm
# CONFIG_BLK_DEV_ZONED is not set
CONFIG_BLK_DEV_THROTTLING=3Dy
# CONFIG_BLK_DEV_THROTTLING_LOW is not set
CONFIG_BLK_WBT=3Dy
CONFIG_BLK_WBT_MQ=3Dy
CONFIG_BLK_CGROUP_IOLATENCY=3Dy
# CONFIG_BLK_CGROUP_FC_APPID is not set
# CONFIG_BLK_CGROUP_IOCOST is not set
# CONFIG_BLK_CGROUP_IOPRIO is not set
CONFIG_BLK_DEBUG_FS=3Dy
# CONFIG_BLK_SED_OPAL is not set
# CONFIG_BLK_INLINE_ENCRYPTION is not set

#
# Partition Types
#
CONFIG_PARTITION_ADVANCED=3Dy
# CONFIG_ACORN_PARTITION is not set
# CONFIG_AIX_PARTITION is not set
CONFIG_OSF_PARTITION=3Dy
# CONFIG_AMIGA_PARTITION is not set
# CONFIG_ATARI_PARTITION is not set
CONFIG_MAC_PARTITION=3Dy
CONFIG_MSDOS_PARTITION=3Dy
CONFIG_BSD_DISKLABEL=3Dy
CONFIG_MINIX_SUBPARTITION=3Dy
CONFIG_SOLARIS_X86_PARTITION=3Dy
CONFIG_UNIXWARE_DISKLABEL=3Dy
# CONFIG_LDM_PARTITION is not set
CONFIG_SGI_PARTITION=3Dy
# CONFIG_ULTRIX_PARTITION is not set
CONFIG_SUN_PARTITION=3Dy
CONFIG_KARMA_PARTITION=3Dy
CONFIG_EFI_PARTITION=3Dy
# CONFIG_SYSV68_PARTITION is not set
# CONFIG_CMDLINE_PARTITION is not set
# end of Partition Types

CONFIG_BLOCK_COMPAT=3Dy
CONFIG_BLK_MQ_PCI=3Dy
CONFIG_BLK_MQ_VIRTIO=3Dy
CONFIG_BLK_MQ_RDMA=3Dy
CONFIG_BLK_PM=3Dy
CONFIG_BLOCK_HOLDER_DEPRECATED=3Dy
CONFIG_BLK_MQ_STACKING=3Dy

#
# IO Schedulers
#
CONFIG_MQ_IOSCHED_DEADLINE=3Dy
CONFIG_MQ_IOSCHED_KYBER=3Dy
CONFIG_IOSCHED_BFQ=3Dy
CONFIG_BFQ_GROUP_IOSCHED=3Dy
# CONFIG_BFQ_CGROUP_DEBUG is not set
# end of IO Schedulers

CONFIG_PREEMPT_NOTIFIERS=3Dy
CONFIG_PADATA=3Dy
CONFIG_ASN1=3Dy
CONFIG_INLINE_SPIN_UNLOCK_IRQ=3Dy
CONFIG_INLINE_READ_UNLOCK=3Dy
CONFIG_INLINE_READ_UNLOCK_IRQ=3Dy
CONFIG_INLINE_WRITE_UNLOCK=3Dy
CONFIG_INLINE_WRITE_UNLOCK_IRQ=3Dy
CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=3Dy
CONFIG_MUTEX_SPIN_ON_OWNER=3Dy
CONFIG_RWSEM_SPIN_ON_OWNER=3Dy
CONFIG_LOCK_SPIN_ON_OWNER=3Dy
CONFIG_ARCH_USE_QUEUED_SPINLOCKS=3Dy
CONFIG_QUEUED_SPINLOCKS=3Dy
CONFIG_ARCH_USE_QUEUED_RWLOCKS=3Dy
CONFIG_QUEUED_RWLOCKS=3Dy
CONFIG_ARCH_HAS_MMIOWB=3Dy
CONFIG_MMIOWB=3Dy
CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE=3Dy
CONFIG_FREEZER=3Dy

#
# Executable file formats
#
CONFIG_BINFMT_ELF=3Dy
CONFIG_COMPAT_BINFMT_ELF=3Dy
CONFIG_ELFCORE=3Dy
CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS=3Dy
CONFIG_BINFMT_SCRIPT=3Dy
CONFIG_BINFMT_MISC=3Dm
CONFIG_COREDUMP=3Dy
# end of Executable file formats

#
# Memory Management options
#
CONFIG_ZPOOL=3Dy
CONFIG_SWAP=3Dy
CONFIG_ZSWAP=3Dy
# CONFIG_ZSWAP_DEFAULT_ON is not set
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_DEFLATE is not set
CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZO=3Dy
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_842 is not set
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZ4 is not set
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZ4HC is not set
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_ZSTD is not set
CONFIG_ZSWAP_COMPRESSOR_DEFAULT=3D"lzo"
CONFIG_ZSWAP_ZPOOL_DEFAULT_ZBUD=3Dy
# CONFIG_ZSWAP_ZPOOL_DEFAULT_Z3FOLD is not set
# CONFIG_ZSWAP_ZPOOL_DEFAULT_ZSMALLOC is not set
CONFIG_ZSWAP_ZPOOL_DEFAULT=3D"zbud"
CONFIG_ZBUD=3Dy
# CONFIG_Z3FOLD is not set
CONFIG_ZSMALLOC=3Dy
CONFIG_ZSMALLOC_STAT=3Dy

#
# SLAB allocator options
#
# CONFIG_SLAB is not set
CONFIG_SLUB=3Dy
# CONFIG_SLAB_MERGE_DEFAULT is not set
CONFIG_SLAB_FREELIST_RANDOM=3Dy
# CONFIG_SLAB_FREELIST_HARDENED is not set
# CONFIG_SLUB_STATS is not set
CONFIG_SLUB_CPU_PARTIAL=3Dy
# end of SLAB allocator options

CONFIG_SHUFFLE_PAGE_ALLOCATOR=3Dy
# CONFIG_COMPAT_BRK is not set
CONFIG_SELECT_MEMORY_MODEL=3Dy
CONFIG_SPARSEMEM_MANUAL=3Dy
CONFIG_SPARSEMEM=3Dy
CONFIG_SPARSEMEM_EXTREME=3Dy
CONFIG_SPARSEMEM_VMEMMAP_ENABLE=3Dy
CONFIG_SPARSEMEM_VMEMMAP=3Dy
CONFIG_HAVE_FAST_GUP=3Dy
CONFIG_ARCH_KEEP_MEMBLOCK=3Dy
CONFIG_NUMA_KEEP_MEMINFO=3Dy
CONFIG_MEMORY_ISOLATION=3Dy
CONFIG_EXCLUSIVE_SYSTEM_RAM=3Dy
CONFIG_HAVE_BOOTMEM_INFO_NODE=3Dy
CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=3Dy
CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE=3Dy
CONFIG_MEMORY_HOTPLUG=3Dy
# CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE is not set
CONFIG_MEMORY_HOTREMOVE=3Dy
CONFIG_SPLIT_PTLOCK_CPUS=3D4
CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=3Dy
CONFIG_MEMORY_BALLOON=3Dy
CONFIG_BALLOON_COMPACTION=3Dy
CONFIG_COMPACTION=3Dy
CONFIG_PAGE_REPORTING=3Dy
CONFIG_MIGRATION=3Dy
CONFIG_DEVICE_MIGRATION=3Dy
CONFIG_ARCH_ENABLE_HUGEPAGE_MIGRATION=3Dy
CONFIG_ARCH_ENABLE_THP_MIGRATION=3Dy
CONFIG_HUGETLB_PAGE_SIZE_VARIABLE=3Dy
CONFIG_CONTIG_ALLOC=3Dy
CONFIG_PHYS_ADDR_T_64BIT=3Dy
CONFIG_MMU_NOTIFIER=3Dy
CONFIG_KSM=3Dy
CONFIG_DEFAULT_MMAP_MIN_ADDR=3D4096
CONFIG_ARCH_SUPPORTS_MEMORY_FAILURE=3Dy
CONFIG_MEMORY_FAILURE=3Dy
CONFIG_HWPOISON_INJECT=3Dm
CONFIG_TRANSPARENT_HUGEPAGE=3Dy
# CONFIG_TRANSPARENT_HUGEPAGE_ALWAYS is not set
CONFIG_TRANSPARENT_HUGEPAGE_MADVISE=3Dy
# CONFIG_READ_ONLY_THP_FOR_FS is not set
CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=3Dy
CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=3Dy
CONFIG_USE_PERCPU_NUMA_NODE_ID=3Dy
CONFIG_HAVE_SETUP_PER_CPU_AREA=3Dy
CONFIG_FRONTSWAP=3Dy
CONFIG_CMA=3Dy
# CONFIG_CMA_DEBUG is not set
# CONFIG_CMA_DEBUGFS is not set
# CONFIG_CMA_SYSFS is not set
CONFIG_CMA_AREAS=3D7
CONFIG_MEM_SOFT_DIRTY=3Dy
CONFIG_GENERIC_EARLY_IOREMAP=3Dy
# CONFIG_DEFERRED_STRUCT_PAGE_INIT is not set
CONFIG_PAGE_IDLE_FLAG=3Dy
CONFIG_IDLE_PAGE_TRACKING=3Dy
CONFIG_ARCH_HAS_CURRENT_STACK_POINTER=3Dy
CONFIG_ARCH_HAS_PTE_DEVMAP=3Dy
CONFIG_ZONE_DEVICE=3Dy
CONFIG_HMM_MIRROR=3Dy
CONFIG_GET_FREE_REGION=3Dy
CONFIG_DEVICE_PRIVATE=3Dy
CONFIG_ARCH_USES_HIGH_VMA_FLAGS=3Dy
CONFIG_ARCH_HAS_PKEYS=3Dy
CONFIG_VM_EVENT_COUNTERS=3Dy
# CONFIG_PERCPU_STATS is not set
# CONFIG_GUP_TEST is not set
CONFIG_ARCH_HAS_PTE_SPECIAL=3Dy
CONFIG_ARCH_HAS_HUGEPD=3Dy
# CONFIG_ANON_VMA_NAME is not set
CONFIG_USERFAULTFD=3Dy

#
# Data Access Monitoring
#
# CONFIG_DAMON is not set
# end of Data Access Monitoring
# end of Memory Management options

CONFIG_NET=3Dy
CONFIG_NET_INGRESS=3Dy
CONFIG_NET_EGRESS=3Dy
CONFIG_NET_REDIRECT=3Dy
CONFIG_SKB_EXTENSIONS=3Dy

#
# Networking options
#
CONFIG_PACKET=3Dy
CONFIG_PACKET_DIAG=3Dm
CONFIG_UNIX=3Dy
CONFIG_UNIX_SCM=3Dy
CONFIG_AF_UNIX_OOB=3Dy
CONFIG_UNIX_DIAG=3Dm
CONFIG_TLS=3Dm
CONFIG_TLS_DEVICE=3Dy
# CONFIG_TLS_TOE is not set
CONFIG_XFRM=3Dy
CONFIG_XFRM_OFFLOAD=3Dy
CONFIG_XFRM_ALGO=3Dy
CONFIG_XFRM_USER=3Dy
CONFIG_XFRM_INTERFACE=3Dm
CONFIG_XFRM_SUB_POLICY=3Dy
CONFIG_XFRM_MIGRATE=3Dy
CONFIG_XFRM_STATISTICS=3Dy
CONFIG_XFRM_AH=3Dm
CONFIG_XFRM_ESP=3Dm
CONFIG_XFRM_IPCOMP=3Dm
CONFIG_NET_KEY=3Dm
CONFIG_NET_KEY_MIGRATE=3Dy
CONFIG_XFRM_ESPINTCP=3Dy
# CONFIG_SMC is not set
CONFIG_XDP_SOCKETS=3Dy
CONFIG_XDP_SOCKETS_DIAG=3Dm
CONFIG_INET=3Dy
CONFIG_IP_MULTICAST=3Dy
CONFIG_IP_ADVANCED_ROUTER=3Dy
CONFIG_IP_FIB_TRIE_STATS=3Dy
CONFIG_IP_MULTIPLE_TABLES=3Dy
CONFIG_IP_ROUTE_MULTIPATH=3Dy
CONFIG_IP_ROUTE_VERBOSE=3Dy
CONFIG_IP_ROUTE_CLASSID=3Dy
# CONFIG_IP_PNP is not set
CONFIG_NET_IPIP=3Dm
CONFIG_NET_IPGRE_DEMUX=3Dm
CONFIG_NET_IP_TUNNEL=3Dm
CONFIG_NET_IPGRE=3Dm
CONFIG_NET_IPGRE_BROADCAST=3Dy
CONFIG_IP_MROUTE_COMMON=3Dy
CONFIG_IP_MROUTE=3Dy
CONFIG_IP_MROUTE_MULTIPLE_TABLES=3Dy
CONFIG_IP_PIMSM_V1=3Dy
CONFIG_IP_PIMSM_V2=3Dy
CONFIG_SYN_COOKIES=3Dy
CONFIG_NET_IPVTI=3Dm
CONFIG_NET_UDP_TUNNEL=3Dm
# CONFIG_NET_FOU is not set
# CONFIG_NET_FOU_IP_TUNNELS is not set
CONFIG_INET_AH=3Dm
CONFIG_INET_ESP=3Dm
CONFIG_INET_ESP_OFFLOAD=3Dm
CONFIG_INET_ESPINTCP=3Dy
CONFIG_INET_IPCOMP=3Dm
CONFIG_INET_XFRM_TUNNEL=3Dm
CONFIG_INET_TUNNEL=3Dm
CONFIG_INET_DIAG=3Dm
CONFIG_INET_TCP_DIAG=3Dm
CONFIG_INET_UDP_DIAG=3Dm
CONFIG_INET_RAW_DIAG=3Dm
# CONFIG_INET_DIAG_DESTROY is not set
CONFIG_TCP_CONG_ADVANCED=3Dy
CONFIG_TCP_CONG_BIC=3Dm
CONFIG_TCP_CONG_CUBIC=3Dy
CONFIG_TCP_CONG_WESTWOOD=3Dm
CONFIG_TCP_CONG_HTCP=3Dm
CONFIG_TCP_CONG_HSTCP=3Dm
CONFIG_TCP_CONG_HYBLA=3Dm
CONFIG_TCP_CONG_VEGAS=3Dm
CONFIG_TCP_CONG_NV=3Dm
CONFIG_TCP_CONG_SCALABLE=3Dm
CONFIG_TCP_CONG_LP=3Dm
CONFIG_TCP_CONG_VENO=3Dm
CONFIG_TCP_CONG_YEAH=3Dm
CONFIG_TCP_CONG_ILLINOIS=3Dm
CONFIG_TCP_CONG_DCTCP=3Dm
# CONFIG_TCP_CONG_CDG is not set
CONFIG_TCP_CONG_BBR=3Dm
CONFIG_DEFAULT_CUBIC=3Dy
# CONFIG_DEFAULT_RENO is not set
CONFIG_DEFAULT_TCP_CONG=3D"cubic"
CONFIG_TCP_MD5SIG=3Dy
CONFIG_IPV6=3Dy
CONFIG_IPV6_ROUTER_PREF=3Dy
CONFIG_IPV6_ROUTE_INFO=3Dy
CONFIG_IPV6_OPTIMISTIC_DAD=3Dy
CONFIG_INET6_AH=3Dm
CONFIG_INET6_ESP=3Dm
CONFIG_INET6_ESP_OFFLOAD=3Dm
CONFIG_INET6_ESPINTCP=3Dy
CONFIG_INET6_IPCOMP=3Dm
CONFIG_IPV6_MIP6=3Dm
# CONFIG_IPV6_ILA is not set
CONFIG_INET6_XFRM_TUNNEL=3Dm
CONFIG_INET6_TUNNEL=3Dm
CONFIG_IPV6_VTI=3Dm
CONFIG_IPV6_SIT=3Dm
CONFIG_IPV6_SIT_6RD=3Dy
CONFIG_IPV6_NDISC_NODETYPE=3Dy
CONFIG_IPV6_TUNNEL=3Dm
CONFIG_IPV6_GRE=3Dm
CONFIG_IPV6_MULTIPLE_TABLES=3Dy
# CONFIG_IPV6_SUBTREES is not set
CONFIG_IPV6_MROUTE=3Dy
CONFIG_IPV6_MROUTE_MULTIPLE_TABLES=3Dy
CONFIG_IPV6_PIMSM_V2=3Dy
# CONFIG_IPV6_SEG6_LWTUNNEL is not set
# CONFIG_IPV6_SEG6_HMAC is not set
# CONFIG_IPV6_RPL_LWTUNNEL is not set
# CONFIG_IPV6_IOAM6_LWTUNNEL is not set
CONFIG_NETLABEL=3Dy
CONFIG_MPTCP=3Dy
CONFIG_INET_MPTCP_DIAG=3Dm
CONFIG_MPTCP_IPV6=3Dy
CONFIG_MPTCP_KUNIT_TEST=3Dm
CONFIG_NETWORK_SECMARK=3Dy
CONFIG_NET_PTP_CLASSIFY=3Dy
CONFIG_NETWORK_PHY_TIMESTAMPING=3Dy
CONFIG_NETFILTER=3Dy
CONFIG_NETFILTER_ADVANCED=3Dy
CONFIG_BRIDGE_NETFILTER=3Dm

#
# Core Netfilter Configuration
#
CONFIG_NETFILTER_INGRESS=3Dy
CONFIG_NETFILTER_EGRESS=3Dy
CONFIG_NETFILTER_SKIP_EGRESS=3Dy
CONFIG_NETFILTER_NETLINK=3Dm
CONFIG_NETFILTER_FAMILY_BRIDGE=3Dy
CONFIG_NETFILTER_FAMILY_ARP=3Dy
# CONFIG_NETFILTER_NETLINK_HOOK is not set
# CONFIG_NETFILTER_NETLINK_ACCT is not set
CONFIG_NETFILTER_NETLINK_QUEUE=3Dm
CONFIG_NETFILTER_NETLINK_LOG=3Dm
CONFIG_NETFILTER_NETLINK_OSF=3Dm
CONFIG_NF_CONNTRACK=3Dm
CONFIG_NF_LOG_SYSLOG=3Dm
CONFIG_NETFILTER_CONNCOUNT=3Dm
CONFIG_NF_CONNTRACK_MARK=3Dy
CONFIG_NF_CONNTRACK_SECMARK=3Dy
CONFIG_NF_CONNTRACK_ZONES=3Dy
CONFIG_NF_CONNTRACK_PROCFS=3Dy
CONFIG_NF_CONNTRACK_EVENTS=3Dy
CONFIG_NF_CONNTRACK_TIMEOUT=3Dy
CONFIG_NF_CONNTRACK_TIMESTAMP=3Dy
CONFIG_NF_CONNTRACK_LABELS=3Dy
CONFIG_NF_CT_PROTO_DCCP=3Dy
CONFIG_NF_CT_PROTO_GRE=3Dy
CONFIG_NF_CT_PROTO_SCTP=3Dy
CONFIG_NF_CT_PROTO_UDPLITE=3Dy
CONFIG_NF_CONNTRACK_AMANDA=3Dm
CONFIG_NF_CONNTRACK_FTP=3Dm
CONFIG_NF_CONNTRACK_H323=3Dm
CONFIG_NF_CONNTRACK_IRC=3Dm
CONFIG_NF_CONNTRACK_BROADCAST=3Dm
CONFIG_NF_CONNTRACK_NETBIOS_NS=3Dm
CONFIG_NF_CONNTRACK_SNMP=3Dm
CONFIG_NF_CONNTRACK_PPTP=3Dm
CONFIG_NF_CONNTRACK_SANE=3Dm
CONFIG_NF_CONNTRACK_SIP=3Dm
CONFIG_NF_CONNTRACK_TFTP=3Dm
CONFIG_NF_CT_NETLINK=3Dm
CONFIG_NF_CT_NETLINK_TIMEOUT=3Dm
CONFIG_NF_CT_NETLINK_HELPER=3Dm
CONFIG_NETFILTER_NETLINK_GLUE_CT=3Dy
CONFIG_NF_NAT=3Dm
CONFIG_NF_NAT_AMANDA=3Dm
CONFIG_NF_NAT_FTP=3Dm
CONFIG_NF_NAT_IRC=3Dm
CONFIG_NF_NAT_SIP=3Dm
CONFIG_NF_NAT_TFTP=3Dm
CONFIG_NF_NAT_REDIRECT=3Dy
CONFIG_NF_NAT_MASQUERADE=3Dy
CONFIG_NETFILTER_SYNPROXY=3Dm
CONFIG_NF_TABLES=3Dm
CONFIG_NF_TABLES_INET=3Dy
CONFIG_NF_TABLES_NETDEV=3Dy
CONFIG_NFT_NUMGEN=3Dm
CONFIG_NFT_CT=3Dm
CONFIG_NFT_FLOW_OFFLOAD=3Dm
CONFIG_NFT_CONNLIMIT=3Dm
CONFIG_NFT_LOG=3Dm
CONFIG_NFT_LIMIT=3Dm
CONFIG_NFT_MASQ=3Dm
CONFIG_NFT_REDIR=3Dm
CONFIG_NFT_NAT=3Dm
# CONFIG_NFT_TUNNEL is not set
CONFIG_NFT_OBJREF=3Dm
CONFIG_NFT_QUEUE=3Dm
CONFIG_NFT_QUOTA=3Dm
CONFIG_NFT_REJECT=3Dm
CONFIG_NFT_REJECT_INET=3Dm
CONFIG_NFT_COMPAT=3Dm
CONFIG_NFT_HASH=3Dm
CONFIG_NFT_FIB=3Dm
CONFIG_NFT_FIB_INET=3Dm
CONFIG_NFT_XFRM=3Dm
CONFIG_NFT_SOCKET=3Dm
# CONFIG_NFT_OSF is not set
CONFIG_NFT_TPROXY=3Dm
# CONFIG_NFT_SYNPROXY is not set
CONFIG_NF_DUP_NETDEV=3Dm
CONFIG_NFT_DUP_NETDEV=3Dm
CONFIG_NFT_FWD_NETDEV=3Dm
CONFIG_NFT_FIB_NETDEV=3Dm
# CONFIG_NFT_REJECT_NETDEV is not set
CONFIG_NF_FLOW_TABLE_INET=3Dm
CONFIG_NF_FLOW_TABLE=3Dm
CONFIG_NF_FLOW_TABLE_PROCFS=3Dy
CONFIG_NETFILTER_XTABLES=3Dy
CONFIG_NETFILTER_XTABLES_COMPAT=3Dy

#
# Xtables combined modules
#
CONFIG_NETFILTER_XT_MARK=3Dm
CONFIG_NETFILTER_XT_CONNMARK=3Dm
CONFIG_NETFILTER_XT_SET=3Dm

#
# Xtables targets
#
CONFIG_NETFILTER_XT_TARGET_AUDIT=3Dm
CONFIG_NETFILTER_XT_TARGET_CHECKSUM=3Dm
CONFIG_NETFILTER_XT_TARGET_CLASSIFY=3Dm
CONFIG_NETFILTER_XT_TARGET_CONNMARK=3Dm
CONFIG_NETFILTER_XT_TARGET_CONNSECMARK=3Dm
CONFIG_NETFILTER_XT_TARGET_CT=3Dm
CONFIG_NETFILTER_XT_TARGET_DSCP=3Dm
CONFIG_NETFILTER_XT_TARGET_HL=3Dm
CONFIG_NETFILTER_XT_TARGET_HMARK=3Dm
CONFIG_NETFILTER_XT_TARGET_IDLETIMER=3Dm
# CONFIG_NETFILTER_XT_TARGET_LED is not set
CONFIG_NETFILTER_XT_TARGET_LOG=3Dm
CONFIG_NETFILTER_XT_TARGET_MARK=3Dm
CONFIG_NETFILTER_XT_NAT=3Dm
CONFIG_NETFILTER_XT_TARGET_NETMAP=3Dm
CONFIG_NETFILTER_XT_TARGET_NFLOG=3Dm
CONFIG_NETFILTER_XT_TARGET_NFQUEUE=3Dm
CONFIG_NETFILTER_XT_TARGET_NOTRACK=3Dm
CONFIG_NETFILTER_XT_TARGET_RATEEST=3Dm
CONFIG_NETFILTER_XT_TARGET_REDIRECT=3Dm
CONFIG_NETFILTER_XT_TARGET_MASQUERADE=3Dm
CONFIG_NETFILTER_XT_TARGET_TEE=3Dm
CONFIG_NETFILTER_XT_TARGET_TPROXY=3Dm
CONFIG_NETFILTER_XT_TARGET_TRACE=3Dm
CONFIG_NETFILTER_XT_TARGET_SECMARK=3Dm
CONFIG_NETFILTER_XT_TARGET_TCPMSS=3Dm
CONFIG_NETFILTER_XT_TARGET_TCPOPTSTRIP=3Dm

#
# Xtables matches
#
CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=3Dm
CONFIG_NETFILTER_XT_MATCH_BPF=3Dm
CONFIG_NETFILTER_XT_MATCH_CGROUP=3Dm
CONFIG_NETFILTER_XT_MATCH_CLUSTER=3Dm
CONFIG_NETFILTER_XT_MATCH_COMMENT=3Dm
CONFIG_NETFILTER_XT_MATCH_CONNBYTES=3Dm
CONFIG_NETFILTER_XT_MATCH_CONNLABEL=3Dm
CONFIG_NETFILTER_XT_MATCH_CONNLIMIT=3Dm
CONFIG_NETFILTER_XT_MATCH_CONNMARK=3Dm
CONFIG_NETFILTER_XT_MATCH_CONNTRACK=3Dm
CONFIG_NETFILTER_XT_MATCH_CPU=3Dm
CONFIG_NETFILTER_XT_MATCH_DCCP=3Dm
CONFIG_NETFILTER_XT_MATCH_DEVGROUP=3Dm
CONFIG_NETFILTER_XT_MATCH_DSCP=3Dm
CONFIG_NETFILTER_XT_MATCH_ECN=3Dm
CONFIG_NETFILTER_XT_MATCH_ESP=3Dm
CONFIG_NETFILTER_XT_MATCH_HASHLIMIT=3Dm
CONFIG_NETFILTER_XT_MATCH_HELPER=3Dm
CONFIG_NETFILTER_XT_MATCH_HL=3Dm
# CONFIG_NETFILTER_XT_MATCH_IPCOMP is not set
CONFIG_NETFILTER_XT_MATCH_IPRANGE=3Dm
CONFIG_NETFILTER_XT_MATCH_IPVS=3Dm
# CONFIG_NETFILTER_XT_MATCH_L2TP is not set
CONFIG_NETFILTER_XT_MATCH_LENGTH=3Dm
CONFIG_NETFILTER_XT_MATCH_LIMIT=3Dm
CONFIG_NETFILTER_XT_MATCH_MAC=3Dm
CONFIG_NETFILTER_XT_MATCH_MARK=3Dm
CONFIG_NETFILTER_XT_MATCH_MULTIPORT=3Dm
# CONFIG_NETFILTER_XT_MATCH_NFACCT is not set
CONFIG_NETFILTER_XT_MATCH_OSF=3Dm
CONFIG_NETFILTER_XT_MATCH_OWNER=3Dm
CONFIG_NETFILTER_XT_MATCH_POLICY=3Dm
CONFIG_NETFILTER_XT_MATCH_PHYSDEV=3Dm
CONFIG_NETFILTER_XT_MATCH_PKTTYPE=3Dm
CONFIG_NETFILTER_XT_MATCH_QUOTA=3Dm
CONFIG_NETFILTER_XT_MATCH_RATEEST=3Dm
CONFIG_NETFILTER_XT_MATCH_REALM=3Dm
CONFIG_NETFILTER_XT_MATCH_RECENT=3Dm
CONFIG_NETFILTER_XT_MATCH_SCTP=3Dm
CONFIG_NETFILTER_XT_MATCH_SOCKET=3Dm
CONFIG_NETFILTER_XT_MATCH_STATE=3Dm
CONFIG_NETFILTER_XT_MATCH_STATISTIC=3Dm
CONFIG_NETFILTER_XT_MATCH_STRING=3Dm
CONFIG_NETFILTER_XT_MATCH_TCPMSS=3Dm
# CONFIG_NETFILTER_XT_MATCH_TIME is not set
CONFIG_NETFILTER_XT_MATCH_U32=3Dm
# end of Core Netfilter Configuration

CONFIG_IP_SET=3Dm
CONFIG_IP_SET_MAX=3D256
CONFIG_IP_SET_BITMAP_IP=3Dm
CONFIG_IP_SET_BITMAP_IPMAC=3Dm
CONFIG_IP_SET_BITMAP_PORT=3Dm
CONFIG_IP_SET_HASH_IP=3Dm
CONFIG_IP_SET_HASH_IPMARK=3Dm
CONFIG_IP_SET_HASH_IPPORT=3Dm
CONFIG_IP_SET_HASH_IPPORTIP=3Dm
CONFIG_IP_SET_HASH_IPPORTNET=3Dm
CONFIG_IP_SET_HASH_IPMAC=3Dm
CONFIG_IP_SET_HASH_MAC=3Dm
CONFIG_IP_SET_HASH_NETPORTNET=3Dm
CONFIG_IP_SET_HASH_NET=3Dm
CONFIG_IP_SET_HASH_NETNET=3Dm
CONFIG_IP_SET_HASH_NETPORT=3Dm
CONFIG_IP_SET_HASH_NETIFACE=3Dm
CONFIG_IP_SET_LIST_SET=3Dm
CONFIG_IP_VS=3Dm
CONFIG_IP_VS_IPV6=3Dy
# CONFIG_IP_VS_DEBUG is not set
CONFIG_IP_VS_TAB_BITS=3D12

#
# IPVS transport protocol load balancing support
#
CONFIG_IP_VS_PROTO_TCP=3Dy
CONFIG_IP_VS_PROTO_UDP=3Dy
CONFIG_IP_VS_PROTO_AH_ESP=3Dy
CONFIG_IP_VS_PROTO_ESP=3Dy
CONFIG_IP_VS_PROTO_AH=3Dy
CONFIG_IP_VS_PROTO_SCTP=3Dy

#
# IPVS scheduler
#
CONFIG_IP_VS_RR=3Dm
CONFIG_IP_VS_WRR=3Dm
CONFIG_IP_VS_LC=3Dm
CONFIG_IP_VS_WLC=3Dm
CONFIG_IP_VS_FO=3Dm
CONFIG_IP_VS_OVF=3Dm
CONFIG_IP_VS_LBLC=3Dm
CONFIG_IP_VS_LBLCR=3Dm
CONFIG_IP_VS_DH=3Dm
CONFIG_IP_VS_SH=3Dm
CONFIG_IP_VS_MH=3Dm
CONFIG_IP_VS_SED=3Dm
CONFIG_IP_VS_NQ=3Dm
# CONFIG_IP_VS_TWOS is not set

#
# IPVS SH scheduler
#
CONFIG_IP_VS_SH_TAB_BITS=3D8

#
# IPVS MH scheduler
#
CONFIG_IP_VS_MH_TAB_INDEX=3D12

#
# IPVS application helper
#
CONFIG_IP_VS_FTP=3Dm
CONFIG_IP_VS_NFCT=3Dy
CONFIG_IP_VS_PE_SIP=3Dm

#
# IP: Netfilter Configuration
#
CONFIG_NF_DEFRAG_IPV4=3Dm
CONFIG_NF_SOCKET_IPV4=3Dm
CONFIG_NF_TPROXY_IPV4=3Dm
CONFIG_NF_TABLES_IPV4=3Dy
CONFIG_NFT_REJECT_IPV4=3Dm
CONFIG_NFT_DUP_IPV4=3Dm
CONFIG_NFT_FIB_IPV4=3Dm
CONFIG_NF_TABLES_ARP=3Dy
CONFIG_NF_DUP_IPV4=3Dm
CONFIG_NF_LOG_ARP=3Dm
CONFIG_NF_LOG_IPV4=3Dm
CONFIG_NF_REJECT_IPV4=3Dm
CONFIG_NF_NAT_SNMP_BASIC=3Dm
CONFIG_NF_NAT_PPTP=3Dm
CONFIG_NF_NAT_H323=3Dm
CONFIG_IP_NF_IPTABLES=3Dm
CONFIG_IP_NF_MATCH_AH=3Dm
CONFIG_IP_NF_MATCH_ECN=3Dm
CONFIG_IP_NF_MATCH_RPFILTER=3Dm
CONFIG_IP_NF_MATCH_TTL=3Dm
CONFIG_IP_NF_FILTER=3Dm
CONFIG_IP_NF_TARGET_REJECT=3Dm
CONFIG_IP_NF_TARGET_SYNPROXY=3Dm
CONFIG_IP_NF_NAT=3Dm
CONFIG_IP_NF_TARGET_MASQUERADE=3Dm
CONFIG_IP_NF_TARGET_NETMAP=3Dm
CONFIG_IP_NF_TARGET_REDIRECT=3Dm
CONFIG_IP_NF_MANGLE=3Dm
# CONFIG_IP_NF_TARGET_CLUSTERIP is not set
CONFIG_IP_NF_TARGET_ECN=3Dm
CONFIG_IP_NF_TARGET_TTL=3Dm
CONFIG_IP_NF_RAW=3Dm
CONFIG_IP_NF_SECURITY=3Dm
CONFIG_IP_NF_ARPTABLES=3Dm
CONFIG_IP_NF_ARPFILTER=3Dm
CONFIG_IP_NF_ARP_MANGLE=3Dm
# end of IP: Netfilter Configuration

#
# IPv6: Netfilter Configuration
#
CONFIG_NF_SOCKET_IPV6=3Dm
CONFIG_NF_TPROXY_IPV6=3Dm
CONFIG_NF_TABLES_IPV6=3Dy
CONFIG_NFT_REJECT_IPV6=3Dm
CONFIG_NFT_DUP_IPV6=3Dm
CONFIG_NFT_FIB_IPV6=3Dm
CONFIG_NF_DUP_IPV6=3Dm
CONFIG_NF_REJECT_IPV6=3Dm
CONFIG_NF_LOG_IPV6=3Dm
CONFIG_IP6_NF_IPTABLES=3Dm
CONFIG_IP6_NF_MATCH_AH=3Dm
CONFIG_IP6_NF_MATCH_EUI64=3Dm
CONFIG_IP6_NF_MATCH_FRAG=3Dm
CONFIG_IP6_NF_MATCH_OPTS=3Dm
CONFIG_IP6_NF_MATCH_HL=3Dm
CONFIG_IP6_NF_MATCH_IPV6HEADER=3Dm
CONFIG_IP6_NF_MATCH_MH=3Dm
CONFIG_IP6_NF_MATCH_RPFILTER=3Dm
CONFIG_IP6_NF_MATCH_RT=3Dm
# CONFIG_IP6_NF_MATCH_SRH is not set
# CONFIG_IP6_NF_TARGET_HL is not set
CONFIG_IP6_NF_FILTER=3Dm
CONFIG_IP6_NF_TARGET_REJECT=3Dm
CONFIG_IP6_NF_TARGET_SYNPROXY=3Dm
CONFIG_IP6_NF_MANGLE=3Dm
CONFIG_IP6_NF_RAW=3Dm
CONFIG_IP6_NF_SECURITY=3Dm
CONFIG_IP6_NF_NAT=3Dm
CONFIG_IP6_NF_TARGET_MASQUERADE=3Dm
CONFIG_IP6_NF_TARGET_NPT=3Dm
# end of IPv6: Netfilter Configuration

CONFIG_NF_DEFRAG_IPV6=3Dm
CONFIG_NF_TABLES_BRIDGE=3Dm
# CONFIG_NFT_BRIDGE_META is not set
CONFIG_NFT_BRIDGE_REJECT=3Dm
# CONFIG_NF_CONNTRACK_BRIDGE is not set
CONFIG_BRIDGE_NF_EBTABLES=3Dm
CONFIG_BRIDGE_EBT_BROUTE=3Dm
CONFIG_BRIDGE_EBT_T_FILTER=3Dm
CONFIG_BRIDGE_EBT_T_NAT=3Dm
CONFIG_BRIDGE_EBT_802_3=3Dm
CONFIG_BRIDGE_EBT_AMONG=3Dm
CONFIG_BRIDGE_EBT_ARP=3Dm
CONFIG_BRIDGE_EBT_IP=3Dm
CONFIG_BRIDGE_EBT_IP6=3Dm
CONFIG_BRIDGE_EBT_LIMIT=3Dm
CONFIG_BRIDGE_EBT_MARK=3Dm
CONFIG_BRIDGE_EBT_PKTTYPE=3Dm
CONFIG_BRIDGE_EBT_STP=3Dm
CONFIG_BRIDGE_EBT_VLAN=3Dm
CONFIG_BRIDGE_EBT_ARPREPLY=3Dm
CONFIG_BRIDGE_EBT_DNAT=3Dm
CONFIG_BRIDGE_EBT_MARK_T=3Dm
CONFIG_BRIDGE_EBT_REDIRECT=3Dm
CONFIG_BRIDGE_EBT_SNAT=3Dm
CONFIG_BRIDGE_EBT_LOG=3Dm
CONFIG_BRIDGE_EBT_NFLOG=3Dm
# CONFIG_BPFILTER is not set
# CONFIG_IP_DCCP is not set
CONFIG_IP_SCTP=3Dm
# CONFIG_SCTP_DBG_OBJCNT is not set
# CONFIG_SCTP_DEFAULT_COOKIE_HMAC_MD5 is not set
CONFIG_SCTP_DEFAULT_COOKIE_HMAC_SHA1=3Dy
# CONFIG_SCTP_DEFAULT_COOKIE_HMAC_NONE is not set
CONFIG_SCTP_COOKIE_HMAC_MD5=3Dy
CONFIG_SCTP_COOKIE_HMAC_SHA1=3Dy
CONFIG_INET_SCTP_DIAG=3Dm
# CONFIG_RDS is not set
CONFIG_TIPC=3Dm
CONFIG_TIPC_MEDIA_IB=3Dy
CONFIG_TIPC_MEDIA_UDP=3Dy
CONFIG_TIPC_CRYPTO=3Dy
CONFIG_TIPC_DIAG=3Dm
CONFIG_ATM=3Dm
CONFIG_ATM_CLIP=3Dm
# CONFIG_ATM_CLIP_NO_ICMP is not set
CONFIG_ATM_LANE=3Dm
# CONFIG_ATM_MPOA is not set
CONFIG_ATM_BR2684=3Dm
# CONFIG_ATM_BR2684_IPFILTER is not set
CONFIG_L2TP=3Dm
CONFIG_L2TP_DEBUGFS=3Dm
CONFIG_L2TP_V3=3Dy
CONFIG_L2TP_IP=3Dm
CONFIG_L2TP_ETH=3Dm
CONFIG_STP=3Dm
CONFIG_GARP=3Dm
CONFIG_MRP=3Dm
CONFIG_BRIDGE=3Dm
CONFIG_BRIDGE_IGMP_SNOOPING=3Dy
CONFIG_BRIDGE_VLAN_FILTERING=3Dy
# CONFIG_BRIDGE_MRP is not set
# CONFIG_BRIDGE_CFM is not set
# CONFIG_NET_DSA is not set
CONFIG_VLAN_8021Q=3Dm
CONFIG_VLAN_8021Q_GVRP=3Dy
CONFIG_VLAN_8021Q_MVRP=3Dy
# CONFIG_DECNET is not set
CONFIG_LLC=3Dm
# CONFIG_LLC2 is not set
# CONFIG_ATALK is not set
# CONFIG_X25 is not set
# CONFIG_LAPB is not set
# CONFIG_PHONET is not set
CONFIG_6LOWPAN=3Dm
# CONFIG_6LOWPAN_DEBUGFS is not set
# CONFIG_6LOWPAN_NHC is not set
CONFIG_IEEE802154=3Dm
# CONFIG_IEEE802154_NL802154_EXPERIMENTAL is not set
CONFIG_IEEE802154_SOCKET=3Dm
CONFIG_IEEE802154_6LOWPAN=3Dm
CONFIG_MAC802154=3Dm
CONFIG_NET_SCHED=3Dy

#
# Queueing/Scheduling
#
CONFIG_NET_SCH_CBQ=3Dm
CONFIG_NET_SCH_HTB=3Dm
CONFIG_NET_SCH_HFSC=3Dm
CONFIG_NET_SCH_ATM=3Dm
CONFIG_NET_SCH_PRIO=3Dm
CONFIG_NET_SCH_MULTIQ=3Dm
CONFIG_NET_SCH_RED=3Dm
CONFIG_NET_SCH_SFB=3Dm
CONFIG_NET_SCH_SFQ=3Dm
CONFIG_NET_SCH_TEQL=3Dm
CONFIG_NET_SCH_TBF=3Dm
CONFIG_NET_SCH_CBS=3Dm
# CONFIG_NET_SCH_ETF is not set
# CONFIG_NET_SCH_TAPRIO is not set
CONFIG_NET_SCH_GRED=3Dm
CONFIG_NET_SCH_DSMARK=3Dm
CONFIG_NET_SCH_NETEM=3Dm
CONFIG_NET_SCH_DRR=3Dm
CONFIG_NET_SCH_MQPRIO=3Dm
# CONFIG_NET_SCH_SKBPRIO is not set
CONFIG_NET_SCH_CHOKE=3Dm
CONFIG_NET_SCH_QFQ=3Dm
CONFIG_NET_SCH_CODEL=3Dm
CONFIG_NET_SCH_FQ_CODEL=3Dy
# CONFIG_NET_SCH_CAKE is not set
CONFIG_NET_SCH_FQ=3Dm
CONFIG_NET_SCH_HHF=3Dm
CONFIG_NET_SCH_PIE=3Dm
# CONFIG_NET_SCH_FQ_PIE is not set
CONFIG_NET_SCH_INGRESS=3Dm
CONFIG_NET_SCH_PLUG=3Dm
CONFIG_NET_SCH_ETS=3Dm
CONFIG_NET_SCH_DEFAULT=3Dy
# CONFIG_DEFAULT_FQ is not set
# CONFIG_DEFAULT_CODEL is not set
CONFIG_DEFAULT_FQ_CODEL=3Dy
# CONFIG_DEFAULT_SFQ is not set
# CONFIG_DEFAULT_PFIFO_FAST is not set
CONFIG_DEFAULT_NET_SCH=3D"fq_codel"

#
# Classification
#
CONFIG_NET_CLS=3Dy
CONFIG_NET_CLS_BASIC=3Dm
CONFIG_NET_CLS_TCINDEX=3Dm
CONFIG_NET_CLS_ROUTE4=3Dm
CONFIG_NET_CLS_FW=3Dm
CONFIG_NET_CLS_U32=3Dm
CONFIG_CLS_U32_PERF=3Dy
CONFIG_CLS_U32_MARK=3Dy
CONFIG_NET_CLS_RSVP=3Dm
CONFIG_NET_CLS_RSVP6=3Dm
CONFIG_NET_CLS_FLOW=3Dm
CONFIG_NET_CLS_CGROUP=3Dy
CONFIG_NET_CLS_BPF=3Dm
CONFIG_NET_CLS_FLOWER=3Dm
CONFIG_NET_CLS_MATCHALL=3Dm
CONFIG_NET_EMATCH=3Dy
CONFIG_NET_EMATCH_STACK=3D32
CONFIG_NET_EMATCH_CMP=3Dm
CONFIG_NET_EMATCH_NBYTE=3Dm
CONFIG_NET_EMATCH_U32=3Dm
CONFIG_NET_EMATCH_META=3Dm
CONFIG_NET_EMATCH_TEXT=3Dm
# CONFIG_NET_EMATCH_CANID is not set
CONFIG_NET_EMATCH_IPSET=3Dm
# CONFIG_NET_EMATCH_IPT is not set
CONFIG_NET_CLS_ACT=3Dy
CONFIG_NET_ACT_POLICE=3Dm
CONFIG_NET_ACT_GACT=3Dm
CONFIG_GACT_PROB=3Dy
CONFIG_NET_ACT_MIRRED=3Dm
CONFIG_NET_ACT_SAMPLE=3Dm
# CONFIG_NET_ACT_IPT is not set
CONFIG_NET_ACT_NAT=3Dm
CONFIG_NET_ACT_PEDIT=3Dm
CONFIG_NET_ACT_SIMP=3Dm
CONFIG_NET_ACT_SKBEDIT=3Dm
CONFIG_NET_ACT_CSUM=3Dm
CONFIG_NET_ACT_MPLS=3Dm
CONFIG_NET_ACT_VLAN=3Dm
CONFIG_NET_ACT_BPF=3Dm
# CONFIG_NET_ACT_CONNMARK is not set
# CONFIG_NET_ACT_CTINFO is not set
CONFIG_NET_ACT_SKBMOD=3Dm
# CONFIG_NET_ACT_IFE is not set
CONFIG_NET_ACT_TUNNEL_KEY=3Dm
CONFIG_NET_ACT_CT=3Dm
# CONFIG_NET_ACT_GATE is not set
CONFIG_NET_TC_SKB_EXT=3Dy
CONFIG_NET_SCH_FIFO=3Dy
CONFIG_DCB=3Dy
CONFIG_DNS_RESOLVER=3Dm
# CONFIG_BATMAN_ADV is not set
CONFIG_OPENVSWITCH=3Dm
CONFIG_OPENVSWITCH_GRE=3Dm
CONFIG_OPENVSWITCH_VXLAN=3Dm
CONFIG_OPENVSWITCH_GENEVE=3Dm
CONFIG_VSOCKETS=3Dm
CONFIG_VSOCKETS_DIAG=3Dm
CONFIG_VSOCKETS_LOOPBACK=3Dm
CONFIG_VIRTIO_VSOCKETS=3Dm
CONFIG_VIRTIO_VSOCKETS_COMMON=3Dm
CONFIG_NETLINK_DIAG=3Dm
CONFIG_MPLS=3Dy
CONFIG_NET_MPLS_GSO=3Dy
CONFIG_MPLS_ROUTING=3Dm
CONFIG_MPLS_IPTUNNEL=3Dm
CONFIG_NET_NSH=3Dy
# CONFIG_HSR is not set
CONFIG_NET_SWITCHDEV=3Dy
CONFIG_NET_L3_MASTER_DEV=3Dy
# CONFIG_QRTR is not set
# CONFIG_NET_NCSI is not set
CONFIG_PCPU_DEV_REFCNT=3Dy
CONFIG_RPS=3Dy
CONFIG_RFS_ACCEL=3Dy
CONFIG_SOCK_RX_QUEUE_MAPPING=3Dy
CONFIG_XPS=3Dy
CONFIG_CGROUP_NET_PRIO=3Dy
CONFIG_CGROUP_NET_CLASSID=3Dy
CONFIG_NET_RX_BUSY_POLL=3Dy
CONFIG_BQL=3Dy
CONFIG_BPF_STREAM_PARSER=3Dy
CONFIG_NET_FLOW_LIMIT=3Dy

#
# Network testing
#
CONFIG_NET_PKTGEN=3Dm
CONFIG_NET_DROP_MONITOR=3Dy
# end of Network testing
# end of Networking options

# CONFIG_HAMRADIO is not set
CONFIG_CAN=3Dm
CONFIG_CAN_RAW=3Dm
CONFIG_CAN_BCM=3Dm
CONFIG_CAN_GW=3Dm
# CONFIG_CAN_J1939 is not set
# CONFIG_CAN_ISOTP is not set
CONFIG_BT=3Dm
CONFIG_BT_BREDR=3Dy
CONFIG_BT_RFCOMM=3Dm
CONFIG_BT_RFCOMM_TTY=3Dy
CONFIG_BT_BNEP=3Dm
CONFIG_BT_BNEP_MC_FILTER=3Dy
CONFIG_BT_BNEP_PROTO_FILTER=3Dy
CONFIG_BT_CMTP=3Dm
CONFIG_BT_HIDP=3Dm
CONFIG_BT_HS=3Dy
CONFIG_BT_LE=3Dy
# CONFIG_BT_6LOWPAN is not set
# CONFIG_BT_LEDS is not set
# CONFIG_BT_MSFTEXT is not set
# CONFIG_BT_AOSPEXT is not set
CONFIG_BT_DEBUGFS=3Dy
# CONFIG_BT_SELFTEST is not set

#
# Bluetooth device drivers
#
CONFIG_BT_INTEL=3Dm
CONFIG_BT_BCM=3Dm
CONFIG_BT_RTL=3Dm
CONFIG_BT_HCIBTUSB=3Dm
CONFIG_BT_HCIBTUSB_AUTOSUSPEND=3Dy
CONFIG_BT_HCIBTUSB_BCM=3Dy
# CONFIG_BT_HCIBTUSB_MTK is not set
CONFIG_BT_HCIBTUSB_RTL=3Dy
CONFIG_BT_HCIBTSDIO=3Dm
CONFIG_BT_HCIUART=3Dm
CONFIG_BT_HCIUART_H4=3Dy
CONFIG_BT_HCIUART_BCSP=3Dy
CONFIG_BT_HCIUART_ATH3K=3Dy
# CONFIG_BT_HCIUART_INTEL is not set
# CONFIG_BT_HCIUART_AG6XX is not set
CONFIG_BT_HCIBCM203X=3Dm
CONFIG_BT_HCIBPA10X=3Dm
CONFIG_BT_HCIBFUSB=3Dm
CONFIG_BT_HCIVHCI=3Dm
CONFIG_BT_MRVL=3Dm
CONFIG_BT_MRVL_SDIO=3Dm
CONFIG_BT_ATH3K=3Dm
# CONFIG_BT_MTKSDIO is not set
# CONFIG_BT_VIRTIO is not set
# end of Bluetooth device drivers

# CONFIG_AF_RXRPC is not set
# CONFIG_AF_KCM is not set
CONFIG_STREAM_PARSER=3Dy
# CONFIG_MCTP is not set
CONFIG_FIB_RULES=3Dy
# CONFIG_WIRELESS is not set
CONFIG_RFKILL=3Dm
CONFIG_RFKILL_LEDS=3Dy
CONFIG_RFKILL_INPUT=3Dy
# CONFIG_RFKILL_GPIO is not set
# CONFIG_NET_9P is not set
# CONFIG_CAIF is not set
CONFIG_CEPH_LIB=3Dm
# CONFIG_CEPH_LIB_PRETTYDEBUG is not set
CONFIG_CEPH_LIB_USE_DNS_RESOLVER=3Dy
# CONFIG_NFC is not set
CONFIG_PSAMPLE=3Dm
# CONFIG_NET_IFE is not set
CONFIG_LWTUNNEL=3Dy
CONFIG_LWTUNNEL_BPF=3Dy
CONFIG_DST_CACHE=3Dy
CONFIG_GRO_CELLS=3Dy
CONFIG_SOCK_VALIDATE_XMIT=3Dy
CONFIG_NET_SELFTESTS=3Dy
CONFIG_NET_SOCK_MSG=3Dy
CONFIG_NET_DEVLINK=3Dy
CONFIG_PAGE_POOL=3Dy
# CONFIG_PAGE_POOL_STATS is not set
CONFIG_FAILOVER=3Dm
CONFIG_ETHTOOL_NETLINK=3Dy
CONFIG_NETDEV_ADDR_LIST_TEST=3Dm

#
# Device Drivers
#
CONFIG_HAVE_PCI=3Dy
CONFIG_FORCE_PCI=3Dy
CONFIG_PCI=3Dy
CONFIG_PCI_DOMAINS=3Dy
CONFIG_PCI_SYSCALL=3Dy
CONFIG_PCIEPORTBUS=3Dy
# CONFIG_HOTPLUG_PCI_PCIE is not set
CONFIG_PCIEAER=3Dy
CONFIG_PCIEAER_INJECT=3Dm
CONFIG_PCIE_ECRC=3Dy
CONFIG_PCIEASPM=3Dy
CONFIG_PCIEASPM_DEFAULT=3Dy
# CONFIG_PCIEASPM_POWERSAVE is not set
# CONFIG_PCIEASPM_POWER_SUPERSAVE is not set
# CONFIG_PCIEASPM_PERFORMANCE is not set
CONFIG_PCIE_PME=3Dy
CONFIG_PCIE_DPC=3Dy
# CONFIG_PCIE_PTM is not set
CONFIG_PCI_MSI=3Dy
CONFIG_PCI_MSI_IRQ_DOMAIN=3Dy
CONFIG_PCI_MSI_ARCH_FALLBACKS=3Dy
CONFIG_PCI_QUIRKS=3Dy
# CONFIG_PCI_DEBUG is not set
# CONFIG_PCI_REALLOC_ENABLE_AUTO is not set
CONFIG_PCI_STUB=3Dy
# CONFIG_PCI_PF_STUB is not set
CONFIG_PCI_ATS=3Dy
CONFIG_PCI_IOV=3Dy
CONFIG_PCI_PRI=3Dy
CONFIG_PCI_PASID=3Dy
# CONFIG_PCI_P2PDMA is not set
CONFIG_VGA_ARB=3Dy
CONFIG_VGA_ARB_MAX_GPUS=3D64
CONFIG_HOTPLUG_PCI=3Dy
# CONFIG_HOTPLUG_PCI_CPCI is not set
CONFIG_HOTPLUG_PCI_SHPC=3Dy
CONFIG_HOTPLUG_PCI_POWERNV=3Dy
CONFIG_HOTPLUG_PCI_RPA=3Dm
CONFIG_HOTPLUG_PCI_RPA_DLPAR=3Dm

#
# PCI controller drivers
#
# CONFIG_PCI_FTPCI100 is not set
# CONFIG_PCI_HOST_GENERIC is not set
# CONFIG_PCIE_XILINX is not set
# CONFIG_PCIE_MICROCHIP_HOST is not set

#
# DesignWare PCI Core Support
#
# CONFIG_PCIE_DW_PLAT_HOST is not set
# CONFIG_PCI_MESON is not set
# end of DesignWare PCI Core Support

#
# Mobiveil PCIe Core Support
#
# end of Mobiveil PCIe Core Support

#
# Cadence PCIe controllers support
#
# CONFIG_PCIE_CADENCE_PLAT_HOST is not set
# CONFIG_PCI_J721E_HOST is not set
# end of Cadence PCIe controllers support
# end of PCI controller drivers

#
# PCI Endpoint
#
# CONFIG_PCI_ENDPOINT is not set
# end of PCI Endpoint

#
# PCI switch controller drivers
#
# CONFIG_PCI_SW_SWITCHTEC is not set
# end of PCI switch controller drivers

# CONFIG_CXL_BUS is not set
CONFIG_PCCARD=3Dy
# CONFIG_PCMCIA is not set
CONFIG_CARDBUS=3Dy

#
# PC-card bridges
#
CONFIG_YENTA=3Dm
CONFIG_YENTA_O2=3Dy
CONFIG_YENTA_RICOH=3Dy
CONFIG_YENTA_TI=3Dy
CONFIG_YENTA_ENE_TUNE=3Dy
CONFIG_YENTA_TOSHIBA=3Dy
# CONFIG_RAPIDIO is not set

#
# Generic Driver Options
#
CONFIG_AUXILIARY_BUS=3Dy
# CONFIG_UEVENT_HELPER is not set
CONFIG_DEVTMPFS=3Dy
CONFIG_DEVTMPFS_MOUNT=3Dy
# CONFIG_DEVTMPFS_SAFE is not set
CONFIG_STANDALONE=3Dy
CONFIG_PREVENT_FIRMWARE_BUILD=3Dy

#
# Firmware loader
#
CONFIG_FW_LOADER=3Dy
CONFIG_FW_LOADER_PAGED_BUF=3Dy
CONFIG_FW_LOADER_SYSFS=3Dy
CONFIG_EXTRA_FIRMWARE=3D""
CONFIG_FW_LOADER_USER_HELPER=3Dy
# CONFIG_FW_LOADER_USER_HELPER_FALLBACK is not set
# CONFIG_FW_LOADER_COMPRESS is not set
CONFIG_FW_CACHE=3Dy
# CONFIG_FW_UPLOAD is not set
# end of Firmware loader

CONFIG_WANT_DEV_COREDUMP=3Dy
CONFIG_ALLOW_DEV_COREDUMP=3Dy
CONFIG_DEV_COREDUMP=3Dy
# CONFIG_DEBUG_DRIVER is not set
# CONFIG_DEBUG_DEVRES is not set
# CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
# CONFIG_TEST_ASYNC_DRIVER_PROBE is not set
CONFIG_GENERIC_CPU_AUTOPROBE=3Dy
CONFIG_GENERIC_CPU_VULNERABILITIES=3Dy
CONFIG_REGMAP=3Dy
CONFIG_REGMAP_I2C=3Dy
CONFIG_DMA_SHARED_BUFFER=3Dy
# CONFIG_DMA_FENCE_TRACE is not set
# end of Generic Driver Options

#
# Bus devices
#
# CONFIG_MHI_BUS is not set
# CONFIG_MHI_BUS_EP is not set
# end of Bus devices

CONFIG_CONNECTOR=3Dy
CONFIG_PROC_EVENTS=3Dy

#
# Firmware Drivers
#

#
# ARM System Control and Management Interface Protocol
#
# end of ARM System Control and Management Interface Protocol

# CONFIG_GOOGLE_FIRMWARE is not set

#
# Tegra firmware driver
#
# end of Tegra firmware driver
# end of Firmware Drivers

# CONFIG_GNSS is not set
CONFIG_MTD=3Dm
# CONFIG_MTD_TESTS is not set

#
# Partition parsers
#
# CONFIG_MTD_AR7_PARTS is not set
# CONFIG_MTD_CMDLINE_PARTS is not set
CONFIG_MTD_OF_PARTS=3Dm
# CONFIG_MTD_REDBOOT_PARTS is not set
# end of Partition parsers

#
# User Modules And Translation Layers
#
# CONFIG_MTD_BLOCK is not set
# CONFIG_MTD_BLOCK_RO is not set
# CONFIG_FTL is not set
# CONFIG_NFTL is not set
# CONFIG_INFTL is not set
# CONFIG_RFD_FTL is not set
# CONFIG_SSFDC is not set
# CONFIG_SM_FTL is not set
# CONFIG_MTD_OOPS is not set
# CONFIG_MTD_SWAP is not set
# CONFIG_MTD_PARTITIONED_MASTER is not set

#
# RAM/ROM/Flash chip drivers
#
# CONFIG_MTD_CFI is not set
# CONFIG_MTD_JEDECPROBE is not set
CONFIG_MTD_MAP_BANK_WIDTH_1=3Dy
CONFIG_MTD_MAP_BANK_WIDTH_2=3Dy
CONFIG_MTD_MAP_BANK_WIDTH_4=3Dy
CONFIG_MTD_CFI_I1=3Dy
CONFIG_MTD_CFI_I2=3Dy
# CONFIG_MTD_RAM is not set
# CONFIG_MTD_ROM is not set
# CONFIG_MTD_ABSENT is not set
# end of RAM/ROM/Flash chip drivers

#
# Mapping drivers for chip access
#
# CONFIG_MTD_COMPLEX_MAPPINGS is not set
# CONFIG_MTD_INTEL_VR_NOR is not set
# CONFIG_MTD_PLATRAM is not set
# end of Mapping drivers for chip access

#
# Self-contained MTD device drivers
#
# CONFIG_MTD_PMC551 is not set
# CONFIG_MTD_SLRAM is not set
# CONFIG_MTD_PHRAM is not set
# CONFIG_MTD_MTDRAM is not set
# CONFIG_MTD_BLOCK2MTD is not set
CONFIG_MTD_POWERNV_FLASH=3Dm

#
# Disk-On-Chip Device Drivers
#
# CONFIG_MTD_DOCG3 is not set
# end of Self-contained MTD device drivers

#
# NAND
#
# CONFIG_MTD_ONENAND is not set
# CONFIG_MTD_RAW_NAND is not set

#
# ECC engine support
#
# CONFIG_MTD_NAND_ECC_SW_HAMMING is not set
# CONFIG_MTD_NAND_ECC_SW_BCH is not set
# CONFIG_MTD_NAND_ECC_MXIC is not set
# end of ECC engine support
# end of NAND

#
# LPDDR & LPDDR2 PCM memory drivers
#
# CONFIG_MTD_LPDDR is not set
# end of LPDDR & LPDDR2 PCM memory drivers

CONFIG_MTD_UBI=3Dm
CONFIG_MTD_UBI_WL_THRESHOLD=3D4096
CONFIG_MTD_UBI_BEB_LIMIT=3D20
# CONFIG_MTD_UBI_FASTMAP is not set
# CONFIG_MTD_UBI_GLUEBI is not set
# CONFIG_MTD_UBI_BLOCK is not set
# CONFIG_MTD_HYPERBUS is not set
CONFIG_DTC=3Dy
CONFIG_OF=3Dy
# CONFIG_OF_UNITTEST is not set
CONFIG_OF_FLATTREE=3Dy
CONFIG_OF_EARLY_FLATTREE=3Dy
CONFIG_OF_KOBJ=3Dy
CONFIG_OF_DYNAMIC=3Dy
CONFIG_OF_ADDRESS=3Dy
CONFIG_OF_IRQ=3Dy
CONFIG_OF_RESERVED_MEM=3Dy
# CONFIG_OF_OVERLAY is not set
CONFIG_OF_DMA_DEFAULT_COHERENT=3Dy
CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=3Dy
CONFIG_PARPORT=3Dm
CONFIG_PARPORT_PC=3Dm
CONFIG_PARPORT_SERIAL=3Dm
# CONFIG_PARPORT_PC_FIFO is not set
# CONFIG_PARPORT_PC_SUPERIO is not set
# CONFIG_PARPORT_AX88796 is not set
CONFIG_PARPORT_1284=3Dy
CONFIG_PARPORT_NOT_PC=3Dy
CONFIG_BLK_DEV=3Dy
CONFIG_BLK_DEV_NULL_BLK=3Dm
# CONFIG_BLK_DEV_FD is not set
CONFIG_CDROM=3Dm
# CONFIG_PARIDE is not set
# CONFIG_BLK_DEV_PCIESSD_MTIP32XX is not set
CONFIG_ZRAM=3Dm
CONFIG_ZRAM_DEF_COMP_LZORLE=3Dy
# CONFIG_ZRAM_DEF_COMP_LZO is not set
# CONFIG_ZRAM_DEF_COMP_842 is not set
CONFIG_ZRAM_DEF_COMP=3D"lzo-rle"
CONFIG_ZRAM_WRITEBACK=3Dy
# CONFIG_ZRAM_MEMORY_TRACKING is not set
CONFIG_BLK_DEV_LOOP=3Dm
CONFIG_BLK_DEV_LOOP_MIN_COUNT=3D0
# CONFIG_BLK_DEV_DRBD is not set
CONFIG_BLK_DEV_NBD=3Dm
CONFIG_BLK_DEV_RAM=3Dm
CONFIG_BLK_DEV_RAM_COUNT=3D16
CONFIG_BLK_DEV_RAM_SIZE=3D16384
CONFIG_CDROM_PKTCDVD=3Dm
CONFIG_CDROM_PKTCDVD_BUFFERS=3D8
# CONFIG_CDROM_PKTCDVD_WCACHE is not set
# CONFIG_ATA_OVER_ETH is not set
CONFIG_VIRTIO_BLK=3Dm
CONFIG_BLK_DEV_RBD=3Dm
# CONFIG_BLK_DEV_UBLK is not set

#
# NVME Support
#
CONFIG_NVME_CORE=3Dm
CONFIG_BLK_DEV_NVME=3Dm
CONFIG_NVME_MULTIPATH=3Dy
# CONFIG_NVME_VERBOSE_ERRORS is not set
# CONFIG_NVME_HWMON is not set
CONFIG_NVME_FABRICS=3Dm
CONFIG_NVME_RDMA=3Dm
CONFIG_NVME_FC=3Dm
CONFIG_NVME_TCP=3Dm
# CONFIG_NVME_AUTH is not set
CONFIG_NVME_TARGET=3Dm
# CONFIG_NVME_TARGET_PASSTHRU is not set
CONFIG_NVME_TARGET_LOOP=3Dm
CONFIG_NVME_TARGET_RDMA=3Dm
CONFIG_NVME_TARGET_FC=3Dm
CONFIG_NVME_TARGET_FCLOOP=3Dm
CONFIG_NVME_TARGET_TCP=3Dm
# CONFIG_NVME_TARGET_AUTH is not set
# end of NVME Support

#
# Misc devices
#
CONFIG_SENSORS_LIS3LV02D=3Dm
# CONFIG_AD525X_DPOT is not set
# CONFIG_DUMMY_IRQ is not set
CONFIG_IBMVMC=3Dm
# CONFIG_PHANTOM is not set
CONFIG_TIFM_CORE=3Dm
CONFIG_TIFM_7XX1=3Dm
# CONFIG_ICS932S401 is not set
CONFIG_ENCLOSURE_SERVICES=3Dm
# CONFIG_HP_ILO is not set
CONFIG_APDS9802ALS=3Dm
CONFIG_ISL29003=3Dm
CONFIG_ISL29020=3Dm
CONFIG_SENSORS_TSL2550=3Dm
CONFIG_SENSORS_BH1770=3Dm
CONFIG_SENSORS_APDS990X=3Dm
# CONFIG_HMC6352 is not set
# CONFIG_DS1682 is not set
# CONFIG_SRAM is not set
# CONFIG_DW_XDATA_PCIE is not set
# CONFIG_PCI_ENDPOINT_TEST is not set
# CONFIG_XILINX_SDFEC is not set
CONFIG_MISC_RTSX=3Dm
# CONFIG_HISI_HIKEY_USB is not set
# CONFIG_OPEN_DICE is not set
# CONFIG_VCPU_STALL_DETECTOR is not set
# CONFIG_C2PORT is not set

#
# EEPROM support
#
CONFIG_EEPROM_AT24=3Dm
CONFIG_EEPROM_LEGACY=3Dm
CONFIG_EEPROM_MAX6875=3Dm
CONFIG_EEPROM_93CX6=3Dm
# CONFIG_EEPROM_IDT_89HPESX is not set
# CONFIG_EEPROM_EE1004 is not set
# end of EEPROM support

CONFIG_CB710_CORE=3Dm
# CONFIG_CB710_DEBUG is not set
CONFIG_CB710_DEBUG_ASSUMPTIONS=3Dy

#
# Texas Instruments shared transport line discipline
#
# CONFIG_TI_ST is not set
# end of Texas Instruments shared transport line discipline

CONFIG_SENSORS_LIS3_I2C=3Dm
CONFIG_ALTERA_STAPL=3Dm
CONFIG_GENWQE=3Dm
CONFIG_GENWQE_PLATFORM_ERROR_RECOVERY=3D1
# CONFIG_ECHO is not set
CONFIG_CXL_BASE=3Dy
CONFIG_CXL=3Dm
CONFIG_OCXL_BASE=3Dy
CONFIG_OCXL=3Dm
# CONFIG_BCM_VK is not set
# CONFIG_MISC_ALCOR_PCI is not set
CONFIG_MISC_RTSX_PCI=3Dm
CONFIG_MISC_RTSX_USB=3Dm
# CONFIG_HABANA_AI is not set
# CONFIG_UACCE is not set
# CONFIG_PVPANIC is not set
# end of Misc devices

#
# SCSI device support
#
CONFIG_SCSI_MOD=3Dy
CONFIG_RAID_ATTRS=3Dm
CONFIG_SCSI_COMMON=3Dy
CONFIG_SCSI=3Dy
CONFIG_SCSI_DMA=3Dy
CONFIG_SCSI_NETLINK=3Dy
CONFIG_SCSI_PROC_FS=3Dy

#
# SCSI support type (disk, tape, CD-ROM)
#
CONFIG_BLK_DEV_SD=3Dm
CONFIG_CHR_DEV_ST=3Dm
CONFIG_BLK_DEV_SR=3Dm
CONFIG_CHR_DEV_SG=3Dm
CONFIG_BLK_DEV_BSG=3Dy
CONFIG_CHR_DEV_SCH=3Dm
CONFIG_SCSI_ENCLOSURE=3Dm
CONFIG_SCSI_CONSTANTS=3Dy
CONFIG_SCSI_LOGGING=3Dy
CONFIG_SCSI_SCAN_ASYNC=3Dy

#
# SCSI Transports
#
CONFIG_SCSI_SPI_ATTRS=3Dm
CONFIG_SCSI_FC_ATTRS=3Dm
CONFIG_SCSI_ISCSI_ATTRS=3Dm
CONFIG_SCSI_SAS_ATTRS=3Dm
CONFIG_SCSI_SAS_LIBSAS=3Dm
CONFIG_SCSI_SAS_ATA=3Dy
CONFIG_SCSI_SAS_HOST_SMP=3Dy
CONFIG_SCSI_SRP_ATTRS=3Dm
# end of SCSI Transports

CONFIG_SCSI_LOWLEVEL=3Dy
CONFIG_ISCSI_TCP=3Dm
CONFIG_ISCSI_BOOT_SYSFS=3Dm
# CONFIG_SCSI_CXGB3_ISCSI is not set
CONFIG_SCSI_CXGB4_ISCSI=3Dm
CONFIG_SCSI_BNX2_ISCSI=3Dm
CONFIG_SCSI_BNX2X_FCOE=3Dm
CONFIG_BE2ISCSI=3Dm
CONFIG_CXLFLASH=3Dm
# CONFIG_BLK_DEV_3W_XXXX_RAID is not set
CONFIG_SCSI_HPSA=3Dm
# CONFIG_SCSI_3W_9XXX is not set
# CONFIG_SCSI_3W_SAS is not set
# CONFIG_SCSI_ACARD is not set
CONFIG_SCSI_AACRAID=3Dm
# CONFIG_SCSI_AIC7XXX is not set
# CONFIG_SCSI_AIC79XX is not set
# CONFIG_SCSI_AIC94XX is not set
# CONFIG_SCSI_MVSAS is not set
# CONFIG_SCSI_MVUMI is not set
# CONFIG_SCSI_ADVANSYS is not set
# CONFIG_SCSI_ARCMSR is not set
# CONFIG_SCSI_ESAS2R is not set
# CONFIG_MEGARAID_NEWGEN is not set
# CONFIG_MEGARAID_LEGACY is not set
CONFIG_MEGARAID_SAS=3Dm
CONFIG_SCSI_MPT3SAS=3Dm
CONFIG_SCSI_MPT2SAS_MAX_SGE=3D128
CONFIG_SCSI_MPT3SAS_MAX_SGE=3D128
CONFIG_SCSI_MPT2SAS=3Dm
# CONFIG_SCSI_MPI3MR is not set
CONFIG_SCSI_SMARTPQI=3Dm
# CONFIG_SCSI_HPTIOP is not set
# CONFIG_SCSI_BUSLOGIC is not set
# CONFIG_SCSI_MYRB is not set
# CONFIG_SCSI_MYRS is not set
CONFIG_LIBFC=3Dm
CONFIG_LIBFCOE=3Dm
# CONFIG_FCOE is not set
# CONFIG_SCSI_SNIC is not set
# CONFIG_SCSI_DMX3191D is not set
# CONFIG_SCSI_FDOMAIN_PCI is not set
# CONFIG_SCSI_IPS is not set
CONFIG_SCSI_IBMVSCSI=3Dm
CONFIG_SCSI_IBMVSCSIS=3Dm
CONFIG_SCSI_IBMVFC=3Dm
CONFIG_SCSI_IBMVFC_TRACE=3Dy
# CONFIG_SCSI_INITIO is not set
# CONFIG_SCSI_INIA100 is not set
# CONFIG_SCSI_PPA is not set
# CONFIG_SCSI_IMM is not set
# CONFIG_SCSI_STEX is not set
# CONFIG_SCSI_SYM53C8XX_2 is not set
CONFIG_SCSI_IPR=3Dm
CONFIG_SCSI_IPR_TRACE=3Dy
CONFIG_SCSI_IPR_DUMP=3Dy
# CONFIG_SCSI_QLOGIC_1280 is not set
CONFIG_SCSI_QLA_FC=3Dm
# CONFIG_TCM_QLA2XXX is not set
CONFIG_SCSI_QLA_ISCSI=3Dm
CONFIG_QEDI=3Dm
CONFIG_QEDF=3Dm
CONFIG_SCSI_LPFC=3Dm
# CONFIG_SCSI_LPFC_DEBUG_FS is not set
# CONFIG_SCSI_EFCT is not set
# CONFIG_SCSI_DC395x is not set
# CONFIG_SCSI_AM53C974 is not set
# CONFIG_SCSI_WD719X is not set
CONFIG_SCSI_DEBUG=3Dm
# CONFIG_SCSI_PMCRAID is not set
# CONFIG_SCSI_PM8001 is not set
# CONFIG_SCSI_BFA_FC is not set
CONFIG_SCSI_VIRTIO=3Dm
CONFIG_SCSI_CHELSIO_FCOE=3Dm
CONFIG_SCSI_DH=3Dy
CONFIG_SCSI_DH_RDAC=3Dy
CONFIG_SCSI_DH_HP_SW=3Dy
CONFIG_SCSI_DH_EMC=3Dy
CONFIG_SCSI_DH_ALUA=3Dy
# end of SCSI device support

CONFIG_ATA=3Dm
CONFIG_SATA_HOST=3Dy
CONFIG_ATA_VERBOSE_ERROR=3Dy
CONFIG_ATA_FORCE=3Dy
CONFIG_SATA_PMP=3Dy

#
# Controllers with non-SFF native interface
#
CONFIG_SATA_AHCI=3Dm
CONFIG_SATA_MOBILE_LPM_POLICY=3D0
CONFIG_SATA_AHCI_PLATFORM=3Dm
# CONFIG_AHCI_CEVA is not set
# CONFIG_AHCI_QORIQ is not set
# CONFIG_SATA_INIC162X is not set
# CONFIG_SATA_ACARD_AHCI is not set
# CONFIG_SATA_SIL24 is not set
CONFIG_ATA_SFF=3Dy

#
# SFF controllers with custom DMA interface
#
# CONFIG_PDC_ADMA is not set
# CONFIG_SATA_QSTOR is not set
# CONFIG_SATA_SX4 is not set
CONFIG_ATA_BMDMA=3Dy

#
# SATA SFF controllers with BMDMA
#
CONFIG_ATA_PIIX=3Dm
# CONFIG_SATA_DWC is not set
# CONFIG_SATA_MV is not set
# CONFIG_SATA_NV is not set
# CONFIG_SATA_PROMISE is not set
# CONFIG_SATA_SIL is not set
# CONFIG_SATA_SIS is not set
# CONFIG_SATA_SVW is not set
# CONFIG_SATA_ULI is not set
# CONFIG_SATA_VIA is not set
# CONFIG_SATA_VITESSE is not set

#
# PATA SFF controllers with BMDMA
#
# CONFIG_PATA_ALI is not set
# CONFIG_PATA_AMD is not set
# CONFIG_PATA_ARTOP is not set
# CONFIG_PATA_ATIIXP is not set
# CONFIG_PATA_ATP867X is not set
# CONFIG_PATA_CMD64X is not set
# CONFIG_PATA_CYPRESS is not set
# CONFIG_PATA_EFAR is not set
# CONFIG_PATA_HPT366 is not set
# CONFIG_PATA_HPT37X is not set
# CONFIG_PATA_HPT3X2N is not set
# CONFIG_PATA_HPT3X3 is not set
# CONFIG_PATA_IT8213 is not set
# CONFIG_PATA_IT821X is not set
# CONFIG_PATA_JMICRON is not set
# CONFIG_PATA_MARVELL is not set
# CONFIG_PATA_NETCELL is not set
# CONFIG_PATA_NINJA32 is not set
# CONFIG_PATA_NS87415 is not set
# CONFIG_PATA_OLDPIIX is not set
# CONFIG_PATA_OPTIDMA is not set
# CONFIG_PATA_PDC2027X is not set
# CONFIG_PATA_PDC_OLD is not set
# CONFIG_PATA_RADISYS is not set
# CONFIG_PATA_RDC is not set
# CONFIG_PATA_SCH is not set
# CONFIG_PATA_SERVERWORKS is not set
# CONFIG_PATA_SIL680 is not set
# CONFIG_PATA_SIS is not set
# CONFIG_PATA_TOSHIBA is not set
# CONFIG_PATA_TRIFLEX is not set
# CONFIG_PATA_VIA is not set
# CONFIG_PATA_WINBOND is not set

#
# PIO-only SFF controllers
#
# CONFIG_PATA_CMD640_PCI is not set
# CONFIG_PATA_MPIIX is not set
# CONFIG_PATA_NS87410 is not set
# CONFIG_PATA_OPTI is not set
CONFIG_PATA_PLATFORM=3Dm
CONFIG_PATA_OF_PLATFORM=3Dm
# CONFIG_PATA_RZ1000 is not set

#
# Generic fallback / legacy drivers
#
CONFIG_ATA_GENERIC=3Dm
# CONFIG_PATA_LEGACY is not set
CONFIG_MD=3Dy
CONFIG_BLK_DEV_MD=3Dy
CONFIG_MD_AUTODETECT=3Dy
CONFIG_MD_LINEAR=3Dm
CONFIG_MD_RAID0=3Dm
CONFIG_MD_RAID1=3Dm
CONFIG_MD_RAID10=3Dm
CONFIG_MD_RAID456=3Dm
# CONFIG_MD_MULTIPATH is not set
CONFIG_MD_FAULTY=3Dm
CONFIG_MD_CLUSTER=3Dm
# CONFIG_BCACHE is not set
CONFIG_BLK_DEV_DM_BUILTIN=3Dy
CONFIG_BLK_DEV_DM=3Dm
CONFIG_DM_DEBUG=3Dy
CONFIG_DM_BUFIO=3Dm
# CONFIG_DM_DEBUG_BLOCK_MANAGER_LOCKING is not set
CONFIG_DM_BIO_PRISON=3Dm
CONFIG_DM_PERSISTENT_DATA=3Dm
# CONFIG_DM_UNSTRIPED is not set
CONFIG_DM_CRYPT=3Dm
CONFIG_DM_SNAPSHOT=3Dm
CONFIG_DM_THIN_PROVISIONING=3Dm
CONFIG_DM_CACHE=3Dm
CONFIG_DM_CACHE_SMQ=3Dm
CONFIG_DM_WRITECACHE=3Dm
# CONFIG_DM_EBS is not set
CONFIG_DM_ERA=3Dm
# CONFIG_DM_CLONE is not set
CONFIG_DM_MIRROR=3Dm
CONFIG_DM_LOG_USERSPACE=3Dm
CONFIG_DM_RAID=3Dm
CONFIG_DM_ZERO=3Dm
CONFIG_DM_MULTIPATH=3Dm
CONFIG_DM_MULTIPATH_QL=3Dm
CONFIG_DM_MULTIPATH_ST=3Dm
# CONFIG_DM_MULTIPATH_HST is not set
# CONFIG_DM_MULTIPATH_IOA is not set
CONFIG_DM_DELAY=3Dm
# CONFIG_DM_DUST is not set
CONFIG_DM_UEVENT=3Dy
CONFIG_DM_FLAKEY=3Dm
CONFIG_DM_VERITY=3Dm
# CONFIG_DM_VERITY_VERIFY_ROOTHASH_SIG is not set
# CONFIG_DM_VERITY_FEC is not set
CONFIG_DM_SWITCH=3Dm
CONFIG_DM_LOG_WRITES=3Dm
CONFIG_DM_INTEGRITY=3Dm
CONFIG_DM_AUDIT=3Dy
CONFIG_TARGET_CORE=3Dm
CONFIG_TCM_IBLOCK=3Dm
CONFIG_TCM_FILEIO=3Dm
CONFIG_TCM_PSCSI=3Dm
CONFIG_TCM_USER2=3Dm
CONFIG_LOOPBACK_TARGET=3Dm
# CONFIG_TCM_FC is not set
CONFIG_ISCSI_TARGET=3Dm
CONFIG_ISCSI_TARGET_CXGB4=3Dm
# CONFIG_SBP_TARGET is not set
CONFIG_FUSION=3Dy
CONFIG_FUSION_SPI=3Dm
# CONFIG_FUSION_FC is not set
CONFIG_FUSION_SAS=3Dm
CONFIG_FUSION_MAX_SGE=3D128
# CONFIG_FUSION_CTL is not set
CONFIG_FUSION_LOGGING=3Dy

#
# IEEE 1394 (FireWire) support
#
CONFIG_FIREWIRE=3Dm
CONFIG_FIREWIRE_OHCI=3Dm
CONFIG_FIREWIRE_SBP2=3Dm
CONFIG_FIREWIRE_NET=3Dm
# CONFIG_FIREWIRE_NOSY is not set
# end of IEEE 1394 (FireWire) support

CONFIG_MACINTOSH_DRIVERS=3Dy
CONFIG_MAC_EMUMOUSEBTN=3Dy
# CONFIG_WINDFARM is not set
CONFIG_NETDEVICES=3Dy
CONFIG_MII=3Dm
CONFIG_NET_CORE=3Dy
CONFIG_BONDING=3Dm
CONFIG_DUMMY=3Dm
# CONFIG_WIREGUARD is not set
# CONFIG_EQUALIZER is not set
CONFIG_NET_FC=3Dy
CONFIG_IFB=3Dm
CONFIG_NET_TEAM=3Dm
CONFIG_NET_TEAM_MODE_BROADCAST=3Dm
CONFIG_NET_TEAM_MODE_ROUNDROBIN=3Dm
CONFIG_NET_TEAM_MODE_RANDOM=3Dm
CONFIG_NET_TEAM_MODE_ACTIVEBACKUP=3Dm
CONFIG_NET_TEAM_MODE_LOADBALANCE=3Dm
CONFIG_MACVLAN=3Dm
CONFIG_MACVTAP=3Dm
CONFIG_IPVLAN_L3S=3Dy
CONFIG_IPVLAN=3Dm
CONFIG_IPVTAP=3Dm
CONFIG_VXLAN=3Dm
CONFIG_GENEVE=3Dm
CONFIG_BAREUDP=3Dm
# CONFIG_GTP is not set
# CONFIG_AMT is not set
CONFIG_MACSEC=3Dm
CONFIG_NETCONSOLE=3Dm
CONFIG_NETCONSOLE_DYNAMIC=3Dy
CONFIG_NETPOLL=3Dy
CONFIG_NET_POLL_CONTROLLER=3Dy
CONFIG_TUN=3Dm
CONFIG_TAP=3Dm
CONFIG_TUN_VNET_CROSS_LE=3Dy
CONFIG_VETH=3Dm
CONFIG_VIRTIO_NET=3Dm
CONFIG_NLMON=3Dm
CONFIG_NET_VRF=3Dm
CONFIG_VSOCKMON=3Dm
# CONFIG_ARCNET is not set
# CONFIG_ATM_DRIVERS is not set
CONFIG_ETHERNET=3Dy
CONFIG_MDIO=3Dm
# CONFIG_NET_VENDOR_3COM is not set
# CONFIG_NET_VENDOR_ADAPTEC is not set
# CONFIG_NET_VENDOR_AGERE is not set
# CONFIG_NET_VENDOR_ALACRITECH is not set
# CONFIG_NET_VENDOR_ALTEON is not set
# CONFIG_ALTERA_TSE is not set
CONFIG_NET_VENDOR_AMAZON=3Dy
# CONFIG_ENA_ETHERNET is not set
# CONFIG_NET_VENDOR_AMD is not set
CONFIG_NET_VENDOR_AQUANTIA=3Dy
# CONFIG_AQTION is not set
# CONFIG_NET_VENDOR_ARC is not set
CONFIG_NET_VENDOR_ASIX=3Dy
CONFIG_NET_VENDOR_ATHEROS=3Dy
CONFIG_ATL2=3Dm
CONFIG_ATL1=3Dm
CONFIG_ATL1E=3Dm
CONFIG_ATL1C=3Dm
CONFIG_ALX=3Dm
CONFIG_NET_VENDOR_BROADCOM=3Dy
# CONFIG_B44 is not set
# CONFIG_BCMGENET is not set
CONFIG_BNX2=3Dm
CONFIG_CNIC=3Dm
CONFIG_TIGON3=3Dm
CONFIG_TIGON3_HWMON=3Dy
CONFIG_BNX2X=3Dm
CONFIG_BNX2X_SRIOV=3Dy
# CONFIG_SYSTEMPORT is not set
CONFIG_BNXT=3Dm
CONFIG_BNXT_SRIOV=3Dy
CONFIG_BNXT_FLOWER_OFFLOAD=3Dy
CONFIG_BNXT_DCB=3Dy
CONFIG_BNXT_HWMON=3Dy
CONFIG_NET_VENDOR_CADENCE=3Dy
CONFIG_NET_VENDOR_CAVIUM=3Dy
# CONFIG_THUNDER_NIC_PF is not set
# CONFIG_THUNDER_NIC_VF is not set
# CONFIG_THUNDER_NIC_BGX is not set
# CONFIG_THUNDER_NIC_RGX is not set
CONFIG_CAVIUM_PTP=3Dy
CONFIG_LIQUIDIO=3Dm
CONFIG_LIQUIDIO_VF=3Dm
CONFIG_NET_VENDOR_CHELSIO=3Dy
# CONFIG_CHELSIO_T1 is not set
# CONFIG_CHELSIO_T3 is not set
CONFIG_CHELSIO_T4=3Dm
# CONFIG_CHELSIO_T4_DCB is not set
CONFIG_CHELSIO_T4VF=3Dm
CONFIG_CHELSIO_LIB=3Dm
CONFIG_CHELSIO_INLINE_CRYPTO=3Dy
CONFIG_CHELSIO_IPSEC_INLINE=3Dm
CONFIG_CHELSIO_TLS_DEVICE=3Dm
CONFIG_NET_VENDOR_CISCO=3Dy
CONFIG_ENIC=3Dm
# CONFIG_NET_VENDOR_CORTINA is not set
CONFIG_NET_VENDOR_DAVICOM=3Dy
CONFIG_DNET=3Dm
CONFIG_NET_VENDOR_DEC=3Dy
# CONFIG_NET_TULIP is not set
# CONFIG_NET_VENDOR_DLINK is not set
CONFIG_NET_VENDOR_EMULEX=3Dy
CONFIG_BE2NET=3Dm
CONFIG_BE2NET_HWMON=3Dy
# CONFIG_BE2NET_BE2 is not set
# CONFIG_BE2NET_BE3 is not set
CONFIG_BE2NET_LANCER=3Dy
CONFIG_BE2NET_SKYHAWK=3Dy
CONFIG_NET_VENDOR_ENGLEDER=3Dy
# CONFIG_TSNEP is not set
# CONFIG_NET_VENDOR_EZCHIP is not set
CONFIG_NET_VENDOR_FUNGIBLE=3Dy
# CONFIG_FUN_ETH is not set
CONFIG_NET_VENDOR_GOOGLE=3Dy
CONFIG_GVE=3Dm
# CONFIG_NET_VENDOR_HUAWEI is not set
# CONFIG_NET_VENDOR_I825XX is not set
CONFIG_NET_VENDOR_IBM=3Dy
CONFIG_IBMVETH=3Dm
CONFIG_IBMVNIC=3Dm
CONFIG_NET_VENDOR_INTEL=3Dy
# CONFIG_E100 is not set
# CONFIG_E1000 is not set
CONFIG_E1000E=3Dm
CONFIG_IGB=3Dm
CONFIG_IGB_HWMON=3Dy
CONFIG_IGBVF=3Dm
# CONFIG_IXGB is not set
CONFIG_IXGBE=3Dm
CONFIG_IXGBE_HWMON=3Dy
CONFIG_IXGBE_DCB=3Dy
CONFIG_IXGBE_IPSEC=3Dy
CONFIG_IXGBEVF=3Dm
CONFIG_IXGBEVF_IPSEC=3Dy
CONFIG_I40E=3Dm
CONFIG_I40E_DCB=3Dy
CONFIG_IAVF=3Dm
CONFIG_I40EVF=3Dm
CONFIG_ICE=3Dm
CONFIG_ICE_SWITCHDEV=3Dy
CONFIG_FM10K=3Dm
CONFIG_IGC=3Dm
CONFIG_NET_VENDOR_WANGXUN=3Dy
# CONFIG_TXGBE is not set
# CONFIG_JME is not set
CONFIG_NET_VENDOR_LITEX=3Dy
# CONFIG_LITEX_LITEETH is not set
# CONFIG_NET_VENDOR_MARVELL is not set
CONFIG_NET_VENDOR_MELLANOX=3Dy
CONFIG_MLX4_EN=3Dm
CONFIG_MLX4_EN_DCB=3Dy
CONFIG_MLX4_CORE=3Dm
CONFIG_MLX4_DEBUG=3Dy
# CONFIG_MLX4_CORE_GEN2 is not set
CONFIG_MLX5_CORE=3Dm
CONFIG_MLX5_FPGA=3Dy
CONFIG_MLX5_CORE_EN=3Dy
CONFIG_MLX5_EN_ARFS=3Dy
CONFIG_MLX5_EN_RXNFC=3Dy
CONFIG_MLX5_MPFS=3Dy
CONFIG_MLX5_ESWITCH=3Dy
CONFIG_MLX5_BRIDGE=3Dy
CONFIG_MLX5_CLS_ACT=3Dy
CONFIG_MLX5_TC_CT=3Dy
CONFIG_MLX5_TC_SAMPLE=3Dy
CONFIG_MLX5_CORE_EN_DCB=3Dy
CONFIG_MLX5_CORE_IPOIB=3Dy
CONFIG_MLX5_EN_IPSEC=3Dy
CONFIG_MLX5_EN_TLS=3Dy
CONFIG_MLX5_SW_STEERING=3Dy
# CONFIG_MLX5_SF is not set
CONFIG_MLXSW_CORE=3Dm
CONFIG_MLXSW_CORE_HWMON=3Dy
CONFIG_MLXSW_CORE_THERMAL=3Dy
CONFIG_MLXSW_PCI=3Dm
CONFIG_MLXSW_I2C=3Dm
CONFIG_MLXSW_SPECTRUM=3Dm
CONFIG_MLXSW_SPECTRUM_DCB=3Dy
CONFIG_MLXSW_MINIMAL=3Dm
CONFIG_MLXFW=3Dm
# CONFIG_NET_VENDOR_MICREL is not set
CONFIG_NET_VENDOR_MICROCHIP=3Dy
# CONFIG_LAN743X is not set
# CONFIG_LAN966X_SWITCH is not set
# CONFIG_NET_VENDOR_MICROSEMI is not set
CONFIG_NET_VENDOR_MICROSOFT=3Dy
CONFIG_NET_VENDOR_MYRI=3Dy
CONFIG_MYRI10GE=3Dm
# CONFIG_FEALNX is not set
# CONFIG_NET_VENDOR_NI is not set
# CONFIG_NET_VENDOR_NATSEMI is not set
CONFIG_NET_VENDOR_NETERION=3Dy
# CONFIG_S2IO is not set
CONFIG_NET_VENDOR_NETRONOME=3Dy
CONFIG_NFP=3Dm
CONFIG_NFP_APP_FLOWER=3Dy
CONFIG_NFP_APP_ABM_NIC=3Dy
# CONFIG_NFP_DEBUG is not set
# CONFIG_NET_VENDOR_NVIDIA is not set
CONFIG_NET_VENDOR_OKI=3Dy
CONFIG_ETHOC=3Dm
CONFIG_NET_VENDOR_PACKET_ENGINES=3Dy
# CONFIG_HAMACHI is not set
# CONFIG_YELLOWFIN is not set
CONFIG_NET_VENDOR_PENSANDO=3Dy
CONFIG_IONIC=3Dm
CONFIG_NET_VENDOR_QLOGIC=3Dy
# CONFIG_QLA3XXX is not set
# CONFIG_QLCNIC is not set
CONFIG_NETXEN_NIC=3Dm
CONFIG_QED=3Dm
CONFIG_QED_LL2=3Dy
CONFIG_QED_SRIOV=3Dy
CONFIG_QEDE=3Dm
CONFIG_QED_RDMA=3Dy
CONFIG_QED_ISCSI=3Dy
CONFIG_QED_FCOE=3Dy
CONFIG_QED_OOO=3Dy
CONFIG_NET_VENDOR_BROCADE=3Dy
# CONFIG_BNA is not set
# CONFIG_NET_VENDOR_QUALCOMM is not set
# CONFIG_NET_VENDOR_RDC is not set
CONFIG_NET_VENDOR_REALTEK=3Dy
CONFIG_8139CP=3Dm
CONFIG_8139TOO=3Dm
# CONFIG_8139TOO_PIO is not set
# CONFIG_8139TOO_TUNE_TWISTER is not set
CONFIG_8139TOO_8129=3Dy
# CONFIG_8139_OLD_RX_RESET is not set
CONFIG_R8169=3Dm
# CONFIG_NET_VENDOR_RENESAS is not set
CONFIG_NET_VENDOR_ROCKER=3Dy
CONFIG_ROCKER=3Dm
# CONFIG_NET_VENDOR_SAMSUNG is not set
# CONFIG_NET_VENDOR_SEEQ is not set
# CONFIG_NET_VENDOR_SILAN is not set
# CONFIG_NET_VENDOR_SIS is not set
CONFIG_NET_VENDOR_SOLARFLARE=3Dy
CONFIG_SFC=3Dm
CONFIG_SFC_MTD=3Dy
CONFIG_SFC_MCDI_MON=3Dy
CONFIG_SFC_SRIOV=3Dy
CONFIG_SFC_MCDI_LOGGING=3Dy
# CONFIG_SFC_FALCON is not set
# CONFIG_SFC_SIENA is not set
# CONFIG_NET_VENDOR_SMSC is not set
# CONFIG_NET_VENDOR_SOCIONEXT is not set
# CONFIG_NET_VENDOR_STMICRO is not set
# CONFIG_NET_VENDOR_SUN is not set
# CONFIG_NET_VENDOR_SYNOPSYS is not set
# CONFIG_NET_VENDOR_TEHUTI is not set
# CONFIG_NET_VENDOR_TI is not set
CONFIG_NET_VENDOR_VERTEXCOM=3Dy
# CONFIG_NET_VENDOR_VIA is not set
# CONFIG_NET_VENDOR_WIZNET is not set
# CONFIG_NET_VENDOR_XILINX is not set
# CONFIG_FDDI is not set
# CONFIG_HIPPI is not set
CONFIG_PHYLIB=3Dy
CONFIG_SWPHY=3Dy
CONFIG_LED_TRIGGER_PHY=3Dy
CONFIG_FIXED_PHY=3Dy

#
# MII PHY device drivers
#
CONFIG_AMD_PHY=3Dm
# CONFIG_ADIN_PHY is not set
# CONFIG_ADIN1100_PHY is not set
CONFIG_AQUANTIA_PHY=3Dm
CONFIG_AX88796B_PHY=3Dm
CONFIG_BROADCOM_PHY=3Dm
# CONFIG_BCM54140_PHY is not set
CONFIG_BCM7XXX_PHY=3Dm
# CONFIG_BCM84881_PHY is not set
CONFIG_BCM87XX_PHY=3Dm
CONFIG_BCM_NET_PHYLIB=3Dm
CONFIG_BCM_NET_PHYPTP=3Dm
CONFIG_CICADA_PHY=3Dm
CONFIG_CORTINA_PHY=3Dm
CONFIG_DAVICOM_PHY=3Dm
CONFIG_ICPLUS_PHY=3Dm
CONFIG_LXT_PHY=3Dm
CONFIG_INTEL_XWAY_PHY=3Dm
CONFIG_LSI_ET1011C_PHY=3Dm
CONFIG_MARVELL_PHY=3Dm
CONFIG_MARVELL_10G_PHY=3Dm
# CONFIG_MARVELL_88X2222_PHY is not set
# CONFIG_MAXLINEAR_GPHY is not set
# CONFIG_MEDIATEK_GE_PHY is not set
CONFIG_MICREL_PHY=3Dm
CONFIG_MICROCHIP_PHY=3Dm
CONFIG_MICROCHIP_T1_PHY=3Dm
CONFIG_MICROSEMI_PHY=3Dm
# CONFIG_MOTORCOMM_PHY is not set
CONFIG_NATIONAL_PHY=3Dm
# CONFIG_NXP_C45_TJA11XX_PHY is not set
# CONFIG_NXP_TJA11XX_PHY is not set
CONFIG_QSEMI_PHY=3Dm
CONFIG_REALTEK_PHY=3Dm
CONFIG_RENESAS_PHY=3Dm
CONFIG_ROCKCHIP_PHY=3Dm
CONFIG_SMSC_PHY=3Dm
CONFIG_STE10XP=3Dm
CONFIG_TERANETICS_PHY=3Dm
CONFIG_DP83822_PHY=3Dm
CONFIG_DP83TC811_PHY=3Dm
CONFIG_DP83848_PHY=3Dm
CONFIG_DP83867_PHY=3Dm
# CONFIG_DP83869_PHY is not set
# CONFIG_DP83TD510_PHY is not set
CONFIG_VITESSE_PHY=3Dm
CONFIG_XILINX_GMII2RGMII=3Dm
CONFIG_CAN_DEV=3Dm
CONFIG_CAN_VCAN=3Dm
# CONFIG_CAN_VXCAN is not set
CONFIG_CAN_NETLINK=3Dy
CONFIG_CAN_CALC_BITTIMING=3Dy
# CONFIG_CAN_CAN327 is not set
# CONFIG_CAN_FLEXCAN is not set
# CONFIG_CAN_GRCAN is not set
# CONFIG_CAN_KVASER_PCIEFD is not set
CONFIG_CAN_SLCAN=3Dm
CONFIG_CAN_C_CAN=3Dm
CONFIG_CAN_C_CAN_PLATFORM=3Dm
CONFIG_CAN_C_CAN_PCI=3Dm
CONFIG_CAN_CC770=3Dm
# CONFIG_CAN_CC770_ISA is not set
CONFIG_CAN_CC770_PLATFORM=3Dm
# CONFIG_CAN_CTUCANFD_PCI is not set
# CONFIG_CAN_CTUCANFD_PLATFORM is not set
# CONFIG_CAN_IFI_CANFD is not set
# CONFIG_CAN_M_CAN is not set
# CONFIG_CAN_MSCAN is not set
# CONFIG_CAN_PEAK_PCIEFD is not set
CONFIG_CAN_SJA1000=3Dm
CONFIG_CAN_EMS_PCI=3Dm
# CONFIG_CAN_F81601 is not set
CONFIG_CAN_KVASER_PCI=3Dm
CONFIG_CAN_PEAK_PCI=3Dm
CONFIG_CAN_PEAK_PCIEC=3Dy
CONFIG_CAN_PLX_PCI=3Dm
# CONFIG_CAN_SJA1000_ISA is not set
CONFIG_CAN_SJA1000_PLATFORM=3Dm
CONFIG_CAN_SOFTING=3Dm

#
# CAN USB interfaces
#
CONFIG_CAN_8DEV_USB=3Dm
CONFIG_CAN_EMS_USB=3Dm
# CONFIG_CAN_ESD_USB is not set
# CONFIG_CAN_ETAS_ES58X is not set
# CONFIG_CAN_GS_USB is not set
CONFIG_CAN_KVASER_USB=3Dm
# CONFIG_CAN_MCBA_USB is not set
CONFIG_CAN_PEAK_USB=3Dm
CONFIG_CAN_UCAN=3Dm
# end of CAN USB interfaces

# CONFIG_CAN_DEBUG_DEVICES is not set
CONFIG_MDIO_DEVICE=3Dy
CONFIG_MDIO_BUS=3Dy
CONFIG_FWNODE_MDIO=3Dy
CONFIG_OF_MDIO=3Dy
CONFIG_MDIO_DEVRES=3Dy
CONFIG_MDIO_BITBANG=3Dm
CONFIG_MDIO_BCM_UNIMAC=3Dm
CONFIG_MDIO_CAVIUM=3Dm
CONFIG_MDIO_GPIO=3Dm
CONFIG_MDIO_HISI_FEMAC=3Dm
# CONFIG_MDIO_MVUSB is not set
CONFIG_MDIO_OCTEON=3Dm
CONFIG_MDIO_THUNDER=3Dm

#
# MDIO Multiplexers
#
# CONFIG_MDIO_BUS_MUX_GPIO is not set
# CONFIG_MDIO_BUS_MUX_MULTIPLEXER is not set
# CONFIG_MDIO_BUS_MUX_MMIOREG is not set

#
# PCS device drivers
#
# end of PCS device drivers

# CONFIG_PLIP is not set
CONFIG_PPP=3Dm
CONFIG_PPP_BSDCOMP=3Dm
CONFIG_PPP_DEFLATE=3Dm
CONFIG_PPP_FILTER=3Dy
CONFIG_PPP_MPPE=3Dm
CONFIG_PPP_MULTILINK=3Dy
CONFIG_PPPOATM=3Dm
CONFIG_PPPOE=3Dm
CONFIG_PPTP=3Dm
CONFIG_PPPOL2TP=3Dm
CONFIG_PPP_ASYNC=3Dm
CONFIG_PPP_SYNC_TTY=3Dm
CONFIG_SLIP=3Dm
CONFIG_SLHC=3Dm
CONFIG_SLIP_COMPRESSED=3Dy
CONFIG_SLIP_SMART=3Dy
# CONFIG_SLIP_MODE_SLIP6 is not set
CONFIG_USB_NET_DRIVERS=3Dy
CONFIG_USB_CATC=3Dm
CONFIG_USB_KAWETH=3Dm
CONFIG_USB_PEGASUS=3Dm
CONFIG_USB_RTL8150=3Dm
CONFIG_USB_RTL8152=3Dm
CONFIG_USB_LAN78XX=3Dm
CONFIG_USB_USBNET=3Dm
CONFIG_USB_NET_AX8817X=3Dm
CONFIG_USB_NET_AX88179_178A=3Dm
CONFIG_USB_NET_CDCETHER=3Dm
CONFIG_USB_NET_CDC_EEM=3Dm
CONFIG_USB_NET_CDC_NCM=3Dm
# CONFIG_USB_NET_HUAWEI_CDC_NCM is not set
CONFIG_USB_NET_CDC_MBIM=3Dm
CONFIG_USB_NET_DM9601=3Dm
# CONFIG_USB_NET_SR9700 is not set
# CONFIG_USB_NET_SR9800 is not set
CONFIG_USB_NET_SMSC75XX=3Dm
CONFIG_USB_NET_SMSC95XX=3Dm
CONFIG_USB_NET_GL620A=3Dm
CONFIG_USB_NET_NET1080=3Dm
CONFIG_USB_NET_PLUSB=3Dm
CONFIG_USB_NET_MCS7830=3Dm
CONFIG_USB_NET_RNDIS_HOST=3Dm
CONFIG_USB_NET_CDC_SUBSET_ENABLE=3Dm
CONFIG_USB_NET_CDC_SUBSET=3Dm
CONFIG_USB_ALI_M5632=3Dy
CONFIG_USB_AN2720=3Dy
CONFIG_USB_BELKIN=3Dy
CONFIG_USB_ARMLINUX=3Dy
CONFIG_USB_EPSON2888=3Dy
CONFIG_USB_KC2190=3Dy
CONFIG_USB_NET_ZAURUS=3Dm
CONFIG_USB_NET_CX82310_ETH=3Dm
CONFIG_USB_NET_KALMIA=3Dm
CONFIG_USB_NET_QMI_WWAN=3Dm
CONFIG_USB_HSO=3Dm
CONFIG_USB_NET_INT51X1=3Dm
CONFIG_USB_IPHETH=3Dm
CONFIG_USB_SIERRA_NET=3Dm
CONFIG_USB_VL600=3Dm
CONFIG_USB_NET_CH9200=3Dm
# CONFIG_USB_NET_AQC111 is not set
CONFIG_USB_RTL8153_ECM=3Dm
# CONFIG_WLAN is not set
CONFIG_WAN=3Dy
CONFIG_HDLC=3Dm
CONFIG_HDLC_RAW=3Dm
# CONFIG_HDLC_RAW_ETH is not set
CONFIG_HDLC_CISCO=3Dm
CONFIG_HDLC_FR=3Dm
CONFIG_HDLC_PPP=3Dm

#
# X.25/LAPB support is disabled
#
# CONFIG_PCI200SYN is not set
# CONFIG_WANXL is not set
# CONFIG_PC300TOO is not set
# CONFIG_FARSYNC is not set
CONFIG_IEEE802154_DRIVERS=3Dm
CONFIG_IEEE802154_FAKELB=3Dm
# CONFIG_IEEE802154_ATUSB is not set
# CONFIG_IEEE802154_HWSIM is not set

#
# Wireless WAN
#
# CONFIG_WWAN is not set
# end of Wireless WAN

CONFIG_USB4_NET=3Dm
CONFIG_NETDEVSIM=3Dm
CONFIG_NET_FAILOVER=3Dm
CONFIG_ISDN=3Dy
CONFIG_ISDN_CAPI=3Dy
CONFIG_CAPI_TRACE=3Dy
CONFIG_ISDN_CAPI_MIDDLEWARE=3Dy
CONFIG_MISDN=3Dm
CONFIG_MISDN_DSP=3Dm
CONFIG_MISDN_L1OIP=3Dm

#
# mISDN hardware drivers
#
CONFIG_MISDN_HFCPCI=3Dm
CONFIG_MISDN_HFCMULTI=3Dm
CONFIG_MISDN_HFCUSB=3Dm
CONFIG_MISDN_AVMFRITZ=3Dm
CONFIG_MISDN_SPEEDFAX=3Dm
CONFIG_MISDN_INFINEON=3Dm
CONFIG_MISDN_W6692=3Dm
CONFIG_MISDN_NETJET=3Dm
CONFIG_MISDN_HDLC=3Dm
CONFIG_MISDN_IPAC=3Dm
CONFIG_MISDN_ISAR=3Dm

#
# Input device support
#
CONFIG_INPUT=3Dy
CONFIG_INPUT_LEDS=3Dy
CONFIG_INPUT_FF_MEMLESS=3Dm
CONFIG_INPUT_SPARSEKMAP=3Dm
# CONFIG_INPUT_MATRIXKMAP is not set
CONFIG_INPUT_VIVALDIFMAP=3Dy

#
# Userland interfaces
#
CONFIG_INPUT_MOUSEDEV=3Dy
# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
CONFIG_INPUT_MOUSEDEV_SCREEN_X=3D1024
CONFIG_INPUT_MOUSEDEV_SCREEN_Y=3D768
# CONFIG_INPUT_JOYDEV is not set
CONFIG_INPUT_EVDEV=3Dy
# CONFIG_INPUT_EVBUG is not set

#
# Input Device Drivers
#
CONFIG_INPUT_KEYBOARD=3Dy
# CONFIG_KEYBOARD_ADP5588 is not set
# CONFIG_KEYBOARD_ADP5589 is not set
CONFIG_KEYBOARD_ATKBD=3Dy
# CONFIG_KEYBOARD_QT1050 is not set
# CONFIG_KEYBOARD_QT1070 is not set
# CONFIG_KEYBOARD_QT2160 is not set
# CONFIG_KEYBOARD_DLINK_DIR685 is not set
# CONFIG_KEYBOARD_LKKBD is not set
# CONFIG_KEYBOARD_GPIO is not set
# CONFIG_KEYBOARD_GPIO_POLLED is not set
# CONFIG_KEYBOARD_TCA6416 is not set
# CONFIG_KEYBOARD_TCA8418 is not set
# CONFIG_KEYBOARD_MATRIX is not set
# CONFIG_KEYBOARD_LM8323 is not set
# CONFIG_KEYBOARD_LM8333 is not set
# CONFIG_KEYBOARD_MAX7359 is not set
# CONFIG_KEYBOARD_MCS is not set
# CONFIG_KEYBOARD_MPR121 is not set
# CONFIG_KEYBOARD_NEWTON is not set
# CONFIG_KEYBOARD_OPENCORES is not set
# CONFIG_KEYBOARD_STOWAWAY is not set
# CONFIG_KEYBOARD_SUNKBD is not set
# CONFIG_KEYBOARD_OMAP4 is not set
# CONFIG_KEYBOARD_TM2_TOUCHKEY is not set
# CONFIG_KEYBOARD_XTKBD is not set
# CONFIG_KEYBOARD_CAP11XX is not set
# CONFIG_KEYBOARD_CYPRESS_SF is not set
CONFIG_INPUT_MOUSE=3Dy
CONFIG_MOUSE_PS2=3Dy
CONFIG_MOUSE_PS2_ALPS=3Dy
CONFIG_MOUSE_PS2_BYD=3Dy
CONFIG_MOUSE_PS2_LOGIPS2PP=3Dy
CONFIG_MOUSE_PS2_SYNAPTICS=3Dy
CONFIG_MOUSE_PS2_SYNAPTICS_SMBUS=3Dy
CONFIG_MOUSE_PS2_CYPRESS=3Dy
CONFIG_MOUSE_PS2_TRACKPOINT=3Dy
CONFIG_MOUSE_PS2_ELANTECH=3Dy
CONFIG_MOUSE_PS2_ELANTECH_SMBUS=3Dy
CONFIG_MOUSE_PS2_SENTELIC=3Dy
# CONFIG_MOUSE_PS2_TOUCHKIT is not set
CONFIG_MOUSE_PS2_FOCALTECH=3Dy
CONFIG_MOUSE_PS2_SMBUS=3Dy
CONFIG_MOUSE_SERIAL=3Dm
CONFIG_MOUSE_APPLETOUCH=3Dm
CONFIG_MOUSE_BCM5974=3Dm
CONFIG_MOUSE_CYAPA=3Dm
CONFIG_MOUSE_ELAN_I2C=3Dm
CONFIG_MOUSE_ELAN_I2C_I2C=3Dy
CONFIG_MOUSE_ELAN_I2C_SMBUS=3Dy
CONFIG_MOUSE_VSXXXAA=3Dm
# CONFIG_MOUSE_GPIO is not set
CONFIG_MOUSE_SYNAPTICS_I2C=3Dm
CONFIG_MOUSE_SYNAPTICS_USB=3Dm
# CONFIG_INPUT_JOYSTICK is not set
CONFIG_INPUT_TABLET=3Dy
CONFIG_TABLET_USB_ACECAD=3Dm
CONFIG_TABLET_USB_AIPTEK=3Dm
# CONFIG_TABLET_USB_HANWANG is not set
CONFIG_TABLET_USB_KBTAB=3Dm
# CONFIG_TABLET_USB_PEGASUS is not set
CONFIG_TABLET_SERIAL_WACOM4=3Dm
CONFIG_INPUT_TOUCHSCREEN=3Dy
# CONFIG_TOUCHSCREEN_AD7879 is not set
# CONFIG_TOUCHSCREEN_AR1021_I2C is not set
# CONFIG_TOUCHSCREEN_ATMEL_MXT is not set
# CONFIG_TOUCHSCREEN_AUO_PIXCIR is not set
# CONFIG_TOUCHSCREEN_BU21013 is not set
# CONFIG_TOUCHSCREEN_BU21029 is not set
# CONFIG_TOUCHSCREEN_CHIPONE_ICN8318 is not set
# CONFIG_TOUCHSCREEN_CY8CTMA140 is not set
# CONFIG_TOUCHSCREEN_CY8CTMG110 is not set
# CONFIG_TOUCHSCREEN_CYTTSP_CORE is not set
# CONFIG_TOUCHSCREEN_CYTTSP4_CORE is not set
# CONFIG_TOUCHSCREEN_DYNAPRO is not set
# CONFIG_TOUCHSCREEN_HAMPSHIRE is not set
# CONFIG_TOUCHSCREEN_EETI is not set
# CONFIG_TOUCHSCREEN_EGALAX is not set
# CONFIG_TOUCHSCREEN_EGALAX_SERIAL is not set
# CONFIG_TOUCHSCREEN_EXC3000 is not set
# CONFIG_TOUCHSCREEN_FUJITSU is not set
# CONFIG_TOUCHSCREEN_GOODIX is not set
# CONFIG_TOUCHSCREEN_HIDEEP is not set
# CONFIG_TOUCHSCREEN_HYCON_HY46XX is not set
# CONFIG_TOUCHSCREEN_ILI210X is not set
# CONFIG_TOUCHSCREEN_ILITEK is not set
# CONFIG_TOUCHSCREEN_S6SY761 is not set
# CONFIG_TOUCHSCREEN_GUNZE is not set
# CONFIG_TOUCHSCREEN_EKTF2127 is not set
# CONFIG_TOUCHSCREEN_ELAN is not set
CONFIG_TOUCHSCREEN_ELO=3Dm
CONFIG_TOUCHSCREEN_WACOM_W8001=3Dm
CONFIG_TOUCHSCREEN_WACOM_I2C=3Dm
# CONFIG_TOUCHSCREEN_MAX11801 is not set
# CONFIG_TOUCHSCREEN_MCS5000 is not set
# CONFIG_TOUCHSCREEN_MMS114 is not set
# CONFIG_TOUCHSCREEN_MELFAS_MIP4 is not set
# CONFIG_TOUCHSCREEN_MSG2638 is not set
# CONFIG_TOUCHSCREEN_MTOUCH is not set
# CONFIG_TOUCHSCREEN_IMAGIS is not set
# CONFIG_TOUCHSCREEN_IMX6UL_TSC is not set
# CONFIG_TOUCHSCREEN_INEXIO is not set
# CONFIG_TOUCHSCREEN_MK712 is not set
# CONFIG_TOUCHSCREEN_PENMOUNT is not set
# CONFIG_TOUCHSCREEN_EDT_FT5X06 is not set
# CONFIG_TOUCHSCREEN_TOUCHRIGHT is not set
# CONFIG_TOUCHSCREEN_TOUCHWIN is not set
# CONFIG_TOUCHSCREEN_PIXCIR is not set
# CONFIG_TOUCHSCREEN_WDT87XX_I2C is not set
# CONFIG_TOUCHSCREEN_WM97XX is not set
# CONFIG_TOUCHSCREEN_USB_COMPOSITE is not set
# CONFIG_TOUCHSCREEN_TOUCHIT213 is not set
# CONFIG_TOUCHSCREEN_TSC_SERIO is not set
# CONFIG_TOUCHSCREEN_TSC2004 is not set
# CONFIG_TOUCHSCREEN_TSC2007 is not set
# CONFIG_TOUCHSCREEN_RM_TS is not set
# CONFIG_TOUCHSCREEN_SILEAD is not set
# CONFIG_TOUCHSCREEN_SIS_I2C is not set
# CONFIG_TOUCHSCREEN_ST1232 is not set
# CONFIG_TOUCHSCREEN_STMFTS is not set
# CONFIG_TOUCHSCREEN_SUR40 is not set
# CONFIG_TOUCHSCREEN_SX8654 is not set
# CONFIG_TOUCHSCREEN_TPS6507X is not set
# CONFIG_TOUCHSCREEN_ZET6223 is not set
# CONFIG_TOUCHSCREEN_ZFORCE is not set
# CONFIG_TOUCHSCREEN_ROHM_BU21023 is not set
# CONFIG_TOUCHSCREEN_IQS5XX is not set
# CONFIG_TOUCHSCREEN_ZINITIX is not set
CONFIG_INPUT_MISC=3Dy
# CONFIG_INPUT_AD714X is not set
# CONFIG_INPUT_ATMEL_CAPTOUCH is not set
# CONFIG_INPUT_BMA150 is not set
# CONFIG_INPUT_E3X0_BUTTON is not set
# CONFIG_INPUT_PCSPKR is not set
# CONFIG_INPUT_MMA8450 is not set
# CONFIG_INPUT_GPIO_BEEPER is not set
# CONFIG_INPUT_GPIO_DECODER is not set
# CONFIG_INPUT_GPIO_VIBRA is not set
CONFIG_INPUT_ATI_REMOTE2=3Dm
CONFIG_INPUT_KEYSPAN_REMOTE=3Dm
# CONFIG_INPUT_KXTJ9 is not set
CONFIG_INPUT_POWERMATE=3Dm
CONFIG_INPUT_YEALINK=3Dm
CONFIG_INPUT_CM109=3Dm
CONFIG_INPUT_UINPUT=3Dm
# CONFIG_INPUT_PCF8574 is not set
CONFIG_INPUT_PWM_BEEPER=3Dm
# CONFIG_INPUT_PWM_VIBRA is not set
CONFIG_INPUT_GPIO_ROTARY_ENCODER=3Dm
# CONFIG_INPUT_DA7280_HAPTICS is not set
# CONFIG_INPUT_ADXL34X is not set
# CONFIG_INPUT_IMS_PCU is not set
# CONFIG_INPUT_IQS269A is not set
# CONFIG_INPUT_IQS626A is not set
# CONFIG_INPUT_IQS7222 is not set
# CONFIG_INPUT_CMA3000 is not set
# CONFIG_INPUT_IDEAPAD_SLIDEBAR is not set
# CONFIG_INPUT_DRV260X_HAPTICS is not set
# CONFIG_INPUT_DRV2665_HAPTICS is not set
# CONFIG_INPUT_DRV2667_HAPTICS is not set
CONFIG_RMI4_CORE=3Dm
CONFIG_RMI4_I2C=3Dm
CONFIG_RMI4_SMB=3Dm
CONFIG_RMI4_F03=3Dy
CONFIG_RMI4_F03_SERIO=3Dm
CONFIG_RMI4_2D_SENSOR=3Dy
CONFIG_RMI4_F11=3Dy
CONFIG_RMI4_F12=3Dy
CONFIG_RMI4_F30=3Dy
CONFIG_RMI4_F34=3Dy
# CONFIG_RMI4_F3A is not set
# CONFIG_RMI4_F54 is not set
CONFIG_RMI4_F55=3Dy

#
# Hardware I/O ports
#
CONFIG_SERIO=3Dy
CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=3Dy
CONFIG_SERIO_I8042=3Dy
CONFIG_SERIO_SERPORT=3Dy
# CONFIG_SERIO_PARKBD is not set
# CONFIG_SERIO_PCIPS2 is not set
CONFIG_SERIO_LIBPS2=3Dy
CONFIG_SERIO_RAW=3Dm
# CONFIG_SERIO_XILINX_XPS_PS2 is not set
CONFIG_SERIO_ALTERA_PS2=3Dm
# CONFIG_SERIO_PS2MULT is not set
CONFIG_SERIO_ARC_PS2=3Dm
# CONFIG_SERIO_APBPS2 is not set
# CONFIG_SERIO_GPIO_PS2 is not set
# CONFIG_USERIO is not set
# CONFIG_GAMEPORT is not set
# end of Hardware I/O ports
# end of Input device support

#
# Character devices
#
CONFIG_TTY=3Dy
CONFIG_VT=3Dy
CONFIG_CONSOLE_TRANSLATIONS=3Dy
CONFIG_VT_CONSOLE=3Dy
CONFIG_VT_CONSOLE_SLEEP=3Dy
CONFIG_HW_CONSOLE=3Dy
CONFIG_VT_HW_CONSOLE_BINDING=3Dy
CONFIG_UNIX98_PTYS=3Dy
# CONFIG_LEGACY_PTYS is not set
CONFIG_LDISC_AUTOLOAD=3Dy

#
# Serial drivers
#
CONFIG_SERIAL_EARLYCON=3Dy
CONFIG_SERIAL_8250=3Dy
# CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
CONFIG_SERIAL_8250_16550A_VARIANTS=3Dy
# CONFIG_SERIAL_8250_FINTEK is not set
CONFIG_SERIAL_8250_CONSOLE=3Dy
CONFIG_SERIAL_8250_DMA=3Dy
CONFIG_SERIAL_8250_PCI=3Dy
CONFIG_SERIAL_8250_EXAR=3Dy
CONFIG_SERIAL_8250_NR_UARTS=3D32
CONFIG_SERIAL_8250_RUNTIME_UARTS=3D4
CONFIG_SERIAL_8250_EXTENDED=3Dy
CONFIG_SERIAL_8250_MANY_PORTS=3Dy
CONFIG_SERIAL_8250_SHARE_IRQ=3Dy
# CONFIG_SERIAL_8250_DETECT_IRQ is not set
CONFIG_SERIAL_8250_RSA=3Dy
CONFIG_SERIAL_8250_FSL=3Dy
# CONFIG_SERIAL_8250_DW is not set
# CONFIG_SERIAL_8250_RT288X is not set
CONFIG_SERIAL_8250_PERICOM=3Dy
CONFIG_SERIAL_OF_PLATFORM=3Dm

#
# Non-8250 serial port support
#
# CONFIG_SERIAL_KGDB_NMI is not set
CONFIG_SERIAL_UARTLITE=3Dm
CONFIG_SERIAL_UARTLITE_NR_UARTS=3D1
CONFIG_SERIAL_CORE=3Dy
CONFIG_SERIAL_CORE_CONSOLE=3Dy
CONFIG_CONSOLE_POLL=3Dy
CONFIG_SERIAL_ICOM=3Dm
CONFIG_SERIAL_JSM=3Dm
# CONFIG_SERIAL_SIFIVE is not set
# CONFIG_SERIAL_SCCNXP is not set
# CONFIG_SERIAL_SC16IS7XX is not set
# CONFIG_SERIAL_ALTERA_JTAGUART is not set
# CONFIG_SERIAL_ALTERA_UART is not set
# CONFIG_SERIAL_XILINX_PS_UART is not set
CONFIG_SERIAL_ARC=3Dm
CONFIG_SERIAL_ARC_NR_PORTS=3D1
# CONFIG_SERIAL_RP2 is not set
# CONFIG_SERIAL_FSL_LPUART is not set
# CONFIG_SERIAL_FSL_LINFLEXUART is not set
# CONFIG_SERIAL_CONEXANT_DIGICOLOR is not set
# end of Serial drivers

CONFIG_SERIAL_MCTRL_GPIO=3Dy
CONFIG_SERIAL_NONSTANDARD=3Dy
# CONFIG_MOXA_INTELLIO is not set
# CONFIG_MOXA_SMARTIO is not set
CONFIG_SYNCLINK_GT=3Dm
CONFIG_N_HDLC=3Dm
# CONFIG_PPC_EPAPR_HV_BYTECHAN is not set
CONFIG_N_GSM=3Dm
CONFIG_NOZOMI=3Dm
# CONFIG_NULL_TTY is not set
CONFIG_HVC_DRIVER=3Dy
CONFIG_HVC_IRQ=3Dy
CONFIG_HVC_CONSOLE=3Dy
# CONFIG_HVC_OLD_HVSI is not set
CONFIG_HVC_OPAL=3Dy
CONFIG_HVC_RTAS=3Dy
# CONFIG_HVC_UDBG is not set
CONFIG_HVCS=3Dm
# CONFIG_SERIAL_DEV_BUS is not set
CONFIG_PRINTER=3Dm
# CONFIG_LP_CONSOLE is not set
CONFIG_PPDEV=3Dm
CONFIG_VIRTIO_CONSOLE=3Dm
CONFIG_IBM_BSR=3Dm
CONFIG_POWERNV_OP_PANEL=3Dm
CONFIG_IPMI_HANDLER=3Dm
CONFIG_IPMI_PLAT_DATA=3Dy
CONFIG_IPMI_PANIC_EVENT=3Dy
CONFIG_IPMI_PANIC_STRING=3Dy
CONFIG_IPMI_DEVICE_INTERFACE=3Dm
CONFIG_IPMI_SI=3Dm
CONFIG_IPMI_SSIF=3Dm
CONFIG_IPMI_POWERNV=3Dm
CONFIG_IPMI_WATCHDOG=3Dm
CONFIG_IPMI_POWEROFF=3Dm
CONFIG_HW_RANDOM=3Dy
CONFIG_HW_RANDOM_TIMERIOMEM=3Dm
# CONFIG_HW_RANDOM_BA431 is not set
CONFIG_HW_RANDOM_VIRTIO=3Dy
CONFIG_HW_RANDOM_PSERIES=3Dm
CONFIG_HW_RANDOM_POWERNV=3Dm
# CONFIG_HW_RANDOM_CCTRNG is not set
# CONFIG_HW_RANDOM_XIPHERA is not set
# CONFIG_APPLICOM is not set
CONFIG_DEVMEM=3Dy
CONFIG_NVRAM=3Dy
# CONFIG_DEVPORT is not set
CONFIG_HANGCHECK_TIMER=3Dm
CONFIG_TCG_TPM=3Dy
CONFIG_HW_RANDOM_TPM=3Dy
CONFIG_TCG_TIS_CORE=3Dy
CONFIG_TCG_TIS=3Dy
# CONFIG_TCG_TIS_I2C is not set
# CONFIG_TCG_TIS_I2C_CR50 is not set
CONFIG_TCG_TIS_I2C_ATMEL=3Dy
CONFIG_TCG_TIS_I2C_INFINEON=3Dy
CONFIG_TCG_TIS_I2C_NUVOTON=3Dy
# CONFIG_TCG_ATMEL is not set
CONFIG_TCG_IBMVTPM=3Dy
# CONFIG_TCG_VTPM_PROXY is not set
CONFIG_TCG_TIS_ST33ZP24=3Dm
CONFIG_TCG_TIS_ST33ZP24_I2C=3Dm
# CONFIG_XILLYBUS is not set
# CONFIG_XILLYUSB is not set
CONFIG_RANDOM_TRUST_CPU=3Dy
# CONFIG_RANDOM_TRUST_BOOTLOADER is not set
# end of Character devices

#
# I2C support
#
CONFIG_I2C=3Dy
CONFIG_I2C_BOARDINFO=3Dy
CONFIG_I2C_COMPAT=3Dy
CONFIG_I2C_CHARDEV=3Dm
CONFIG_I2C_MUX=3Dm

#
# Multiplexer I2C Chip support
#
# CONFIG_I2C_ARB_GPIO_CHALLENGE is not set
# CONFIG_I2C_MUX_GPIO is not set
# CONFIG_I2C_MUX_GPMUX is not set
# CONFIG_I2C_MUX_LTC4306 is not set
# CONFIG_I2C_MUX_PCA9541 is not set
# CONFIG_I2C_MUX_PCA954x is not set
# CONFIG_I2C_MUX_REG is not set
CONFIG_I2C_MUX_MLXCPLD=3Dm
# end of Multiplexer I2C Chip support

CONFIG_I2C_HELPER_AUTO=3Dy
CONFIG_I2C_SMBUS=3Dm
CONFIG_I2C_ALGOBIT=3Dm
CONFIG_I2C_ALGOPCA=3Dm

#
# I2C Hardware Bus support
#

#
# PC SMBus host controller drivers
#
# CONFIG_I2C_ALI1535 is not set
# CONFIG_I2C_ALI1563 is not set
# CONFIG_I2C_ALI15X3 is not set
# CONFIG_I2C_AMD756 is not set
# CONFIG_I2C_AMD8111 is not set
# CONFIG_I2C_I801 is not set
# CONFIG_I2C_ISCH is not set
# CONFIG_I2C_PIIX4 is not set
CONFIG_I2C_NFORCE2=3Dm
# CONFIG_I2C_NVIDIA_GPU is not set
# CONFIG_I2C_SIS5595 is not set
# CONFIG_I2C_SIS630 is not set
# CONFIG_I2C_SIS96X is not set
# CONFIG_I2C_VIA is not set
# CONFIG_I2C_VIAPRO is not set

#
# I2C system bus drivers (mostly embedded / system-on-chip)
#
# CONFIG_I2C_CBUS_GPIO is not set
CONFIG_I2C_DESIGNWARE_CORE=3Dm
# CONFIG_I2C_DESIGNWARE_SLAVE is not set
CONFIG_I2C_DESIGNWARE_PLATFORM=3Dm
# CONFIG_I2C_DESIGNWARE_PCI is not set
# CONFIG_I2C_GPIO is not set
CONFIG_I2C_MPC=3Dm
# CONFIG_I2C_OCORES is not set
CONFIG_I2C_PCA_PLATFORM=3Dm
CONFIG_I2C_SIMTEC=3Dm
# CONFIG_I2C_XILINX is not set

#
# External I2C/SMBus adapter drivers
#
CONFIG_I2C_DIOLAN_U2C=3Dm
# CONFIG_I2C_CP2615 is not set
CONFIG_I2C_PARPORT=3Dm
# CONFIG_I2C_ROBOTFUZZ_OSIF is not set
# CONFIG_I2C_TAOS_EVM is not set
CONFIG_I2C_TINY_USB=3Dm
CONFIG_I2C_VIPERBOARD=3Dm

#
# Other I2C/SMBus bus drivers
#
CONFIG_I2C_OPAL=3Dy
# CONFIG_I2C_VIRTIO is not set
# end of I2C Hardware Bus support

CONFIG_I2C_STUB=3Dm
# CONFIG_I2C_SLAVE is not set
# CONFIG_I2C_DEBUG_CORE is not set
# CONFIG_I2C_DEBUG_ALGO is not set
# CONFIG_I2C_DEBUG_BUS is not set
# end of I2C support

# CONFIG_I3C is not set
# CONFIG_SPI is not set
# CONFIG_SPMI is not set
# CONFIG_HSI is not set
CONFIG_PPS=3Dy
# CONFIG_PPS_DEBUG is not set

#
# PPS clients support
#
# CONFIG_PPS_CLIENT_KTIMER is not set
CONFIG_PPS_CLIENT_LDISC=3Dm
CONFIG_PPS_CLIENT_PARPORT=3Dm
CONFIG_PPS_CLIENT_GPIO=3Dm

#
# PPS generators support
#

#
# PTP clock support
#
CONFIG_PTP_1588_CLOCK=3Dy
CONFIG_PTP_1588_CLOCK_OPTIONAL=3Dy
CONFIG_DP83640_PHY=3Dm
# CONFIG_PTP_1588_CLOCK_INES is not set
# CONFIG_PTP_1588_CLOCK_IDT82P33 is not set
# CONFIG_PTP_1588_CLOCK_IDTCM is not set
# end of PTP clock support

# CONFIG_PINCTRL is not set
CONFIG_GPIOLIB=3Dy
CONFIG_GPIOLIB_FASTPATH_LIMIT=3D512
CONFIG_OF_GPIO=3Dy
CONFIG_GPIOLIB_IRQCHIP=3Dy
# CONFIG_DEBUG_GPIO is not set
CONFIG_GPIO_CDEV=3Dy
CONFIG_GPIO_CDEV_V1=3Dy

#
# Memory mapped GPIO drivers
#
# CONFIG_GPIO_74XX_MMIO is not set
# CONFIG_GPIO_ALTERA is not set
# CONFIG_GPIO_CADENCE is not set
# CONFIG_GPIO_DWAPB is not set
# CONFIG_GPIO_EXAR is not set
# CONFIG_GPIO_FTGPIO010 is not set
# CONFIG_GPIO_GENERIC_PLATFORM is not set
# CONFIG_GPIO_GRGPIO is not set
# CONFIG_GPIO_HLWD is not set
# CONFIG_GPIO_MB86S7X is not set
# CONFIG_GPIO_SIFIVE is not set
# CONFIG_GPIO_XILINX is not set
# CONFIG_GPIO_AMD_FCH is not set
# end of Memory mapped GPIO drivers

#
# I2C GPIO expanders
#
# CONFIG_GPIO_ADP5588 is not set
# CONFIG_GPIO_ADNP is not set
# CONFIG_GPIO_GW_PLD is not set
# CONFIG_GPIO_MAX7300 is not set
# CONFIG_GPIO_MAX732X is not set
CONFIG_GPIO_PCA953X=3Dm
# CONFIG_GPIO_PCA953X_IRQ is not set
# CONFIG_GPIO_PCA9570 is not set
CONFIG_GPIO_PCF857X=3Dm
# CONFIG_GPIO_TPIC2810 is not set
# end of I2C GPIO expanders

#
# MFD GPIO expanders
#
# end of MFD GPIO expanders

#
# PCI GPIO expanders
#
# CONFIG_GPIO_PCI_IDIO_16 is not set
# CONFIG_GPIO_PCIE_IDIO_24 is not set
# CONFIG_GPIO_RDC321X is not set
# end of PCI GPIO expanders

#
# USB GPIO expanders
#
CONFIG_GPIO_VIPERBOARD=3Dm
# end of USB GPIO expanders

#
# Virtual GPIO drivers
#
# CONFIG_GPIO_AGGREGATOR is not set
# CONFIG_GPIO_MOCKUP is not set
# CONFIG_GPIO_VIRTIO is not set
# CONFIG_GPIO_SIM is not set
# end of Virtual GPIO drivers

# CONFIG_W1 is not set
CONFIG_POWER_RESET=3Dy
CONFIG_POWER_RESET_GPIO=3Dy
# CONFIG_POWER_RESET_GPIO_RESTART is not set
# CONFIG_POWER_RESET_LTC2952 is not set
# CONFIG_POWER_RESET_RESTART is not set
# CONFIG_POWER_RESET_SYSCON is not set
# CONFIG_POWER_RESET_SYSCON_POWEROFF is not set
# CONFIG_NVMEM_REBOOT_MODE is not set
CONFIG_POWER_SUPPLY=3Dy
# CONFIG_POWER_SUPPLY_DEBUG is not set
CONFIG_POWER_SUPPLY_HWMON=3Dy
# CONFIG_PDA_POWER is not set
# CONFIG_IP5XXX_POWER is not set
# CONFIG_TEST_POWER is not set
# CONFIG_CHARGER_ADP5061 is not set
# CONFIG_BATTERY_CW2015 is not set
# CONFIG_BATTERY_DS2780 is not set
# CONFIG_BATTERY_DS2781 is not set
# CONFIG_BATTERY_DS2782 is not set
# CONFIG_BATTERY_SAMSUNG_SDI is not set
# CONFIG_BATTERY_SBS is not set
# CONFIG_CHARGER_SBS is not set
# CONFIG_MANAGER_SBS is not set
# CONFIG_BATTERY_BQ27XXX is not set
# CONFIG_BATTERY_MAX17040 is not set
# CONFIG_BATTERY_MAX17042 is not set
# CONFIG_CHARGER_MAX8903 is not set
# CONFIG_CHARGER_LP8727 is not set
# CONFIG_CHARGER_GPIO is not set
# CONFIG_CHARGER_LT3651 is not set
# CONFIG_CHARGER_LTC4162L is not set
# CONFIG_CHARGER_DETECTOR_MAX14656 is not set
# CONFIG_CHARGER_MAX77976 is not set
# CONFIG_CHARGER_BQ2415X is not set
# CONFIG_CHARGER_BQ24257 is not set
# CONFIG_CHARGER_BQ24735 is not set
# CONFIG_CHARGER_BQ2515X is not set
# CONFIG_CHARGER_BQ25890 is not set
# CONFIG_CHARGER_BQ25980 is not set
# CONFIG_CHARGER_BQ256XX is not set
# CONFIG_BATTERY_GAUGE_LTC2941 is not set
# CONFIG_BATTERY_GOLDFISH is not set
# CONFIG_BATTERY_RT5033 is not set
# CONFIG_CHARGER_RT9455 is not set
# CONFIG_CHARGER_BD99954 is not set
# CONFIG_BATTERY_UG3105 is not set
CONFIG_HWMON=3Dy
CONFIG_HWMON_VID=3Dm
# CONFIG_HWMON_DEBUG_CHIP is not set

#
# Native drivers
#
CONFIG_SENSORS_AD7414=3Dm
CONFIG_SENSORS_AD7418=3Dm
CONFIG_SENSORS_ADM1025=3Dm
CONFIG_SENSORS_ADM1026=3Dm
CONFIG_SENSORS_ADM1029=3Dm
CONFIG_SENSORS_ADM1031=3Dm
# CONFIG_SENSORS_ADM1177 is not set
CONFIG_SENSORS_ADM9240=3Dm
CONFIG_SENSORS_ADT7X10=3Dm
CONFIG_SENSORS_ADT7410=3Dm
CONFIG_SENSORS_ADT7411=3Dm
CONFIG_SENSORS_ADT7462=3Dm
CONFIG_SENSORS_ADT7470=3Dm
CONFIG_SENSORS_ADT7475=3Dm
# CONFIG_SENSORS_AHT10 is not set
# CONFIG_SENSORS_AQUACOMPUTER_D5NEXT is not set
# CONFIG_SENSORS_AS370 is not set
CONFIG_SENSORS_ASC7621=3Dm
# CONFIG_SENSORS_AXI_FAN_CONTROL is not set
# CONFIG_SENSORS_ASPEED is not set
CONFIG_SENSORS_ATXP1=3Dm
# CONFIG_SENSORS_CORSAIR_CPRO is not set
# CONFIG_SENSORS_CORSAIR_PSU is not set
# CONFIG_SENSORS_DRIVETEMP is not set
CONFIG_SENSORS_DS620=3Dm
CONFIG_SENSORS_DS1621=3Dm
# CONFIG_SENSORS_I5K_AMB is not set
CONFIG_SENSORS_F75375S=3Dm
# CONFIG_SENSORS_FTSTEUTATES is not set
CONFIG_SENSORS_GL518SM=3Dm
CONFIG_SENSORS_GL520SM=3Dm
CONFIG_SENSORS_G760A=3Dm
# CONFIG_SENSORS_G762 is not set
# CONFIG_SENSORS_GPIO_FAN is not set
# CONFIG_SENSORS_HIH6130 is not set
CONFIG_SENSORS_IBMAEM=3Dm
CONFIG_SENSORS_IBMPEX=3Dm
CONFIG_SENSORS_IBMPOWERNV=3Dm
CONFIG_SENSORS_JC42=3Dm
# CONFIG_SENSORS_POWR1220 is not set
CONFIG_SENSORS_LINEAGE=3Dm
# CONFIG_SENSORS_LTC2945 is not set
# CONFIG_SENSORS_LTC2947_I2C is not set
# CONFIG_SENSORS_LTC2990 is not set
# CONFIG_SENSORS_LTC2992 is not set
CONFIG_SENSORS_LTC4151=3Dm
CONFIG_SENSORS_LTC4215=3Dm
# CONFIG_SENSORS_LTC4222 is not set
CONFIG_SENSORS_LTC4245=3Dm
# CONFIG_SENSORS_LTC4260 is not set
CONFIG_SENSORS_LTC4261=3Dm
# CONFIG_SENSORS_MAX127 is not set
CONFIG_SENSORS_MAX16065=3Dm
CONFIG_SENSORS_MAX1619=3Dm
CONFIG_SENSORS_MAX1668=3Dm
CONFIG_SENSORS_MAX197=3Dm
# CONFIG_SENSORS_MAX31730 is not set
# CONFIG_SENSORS_MAX6620 is not set
# CONFIG_SENSORS_MAX6621 is not set
CONFIG_SENSORS_MAX6639=3Dm
CONFIG_SENSORS_MAX6650=3Dm
CONFIG_SENSORS_MAX6697=3Dm
# CONFIG_SENSORS_MAX31790 is not set
CONFIG_SENSORS_MCP3021=3Dm
# CONFIG_SENSORS_TC654 is not set
# CONFIG_SENSORS_TPS23861 is not set
# CONFIG_SENSORS_MR75203 is not set
CONFIG_SENSORS_LM63=3Dm
CONFIG_SENSORS_LM73=3Dm
CONFIG_SENSORS_LM75=3Dm
CONFIG_SENSORS_LM77=3Dm
CONFIG_SENSORS_LM78=3Dm
CONFIG_SENSORS_LM80=3Dm
CONFIG_SENSORS_LM83=3Dm
CONFIG_SENSORS_LM85=3Dm
CONFIG_SENSORS_LM87=3Dm
CONFIG_SENSORS_LM90=3Dm
CONFIG_SENSORS_LM92=3Dm
CONFIG_SENSORS_LM93=3Dm
CONFIG_SENSORS_LM95234=3Dm
CONFIG_SENSORS_LM95241=3Dm
CONFIG_SENSORS_LM95245=3Dm
# CONFIG_SENSORS_NCT6775_I2C is not set
# CONFIG_SENSORS_NCT7802 is not set
# CONFIG_SENSORS_NCT7904 is not set
# CONFIG_SENSORS_NPCM7XX is not set
# CONFIG_SENSORS_NZXT_KRAKEN2 is not set
# CONFIG_SENSORS_NZXT_SMART2 is not set
CONFIG_SENSORS_PCF8591=3Dm
CONFIG_PMBUS=3Dm
CONFIG_SENSORS_PMBUS=3Dm
# CONFIG_SENSORS_ADM1266 is not set
CONFIG_SENSORS_ADM1275=3Dm
# CONFIG_SENSORS_BEL_PFE is not set
# CONFIG_SENSORS_BPA_RS600 is not set
# CONFIG_SENSORS_DELTA_AHE50DC_FAN is not set
# CONFIG_SENSORS_FSP_3Y is not set
# CONFIG_SENSORS_IBM_CFFPS is not set
# CONFIG_SENSORS_DPS920AB is not set
# CONFIG_SENSORS_INSPUR_IPSPS is not set
# CONFIG_SENSORS_IR35221 is not set
# CONFIG_SENSORS_IR36021 is not set
# CONFIG_SENSORS_IR38064 is not set
# CONFIG_SENSORS_IRPS5401 is not set
# CONFIG_SENSORS_ISL68137 is not set
CONFIG_SENSORS_LM25066=3Dm
# CONFIG_SENSORS_LT7182S is not set
CONFIG_SENSORS_LTC2978=3Dm
# CONFIG_SENSORS_LTC3815 is not set
# CONFIG_SENSORS_MAX15301 is not set
CONFIG_SENSORS_MAX16064=3Dm
# CONFIG_SENSORS_MAX16601 is not set
# CONFIG_SENSORS_MAX20730 is not set
# CONFIG_SENSORS_MAX20751 is not set
# CONFIG_SENSORS_MAX31785 is not set
CONFIG_SENSORS_MAX34440=3Dm
CONFIG_SENSORS_MAX8688=3Dm
# CONFIG_SENSORS_MP2888 is not set
# CONFIG_SENSORS_MP2975 is not set
# CONFIG_SENSORS_MP5023 is not set
# CONFIG_SENSORS_PIM4328 is not set
# CONFIG_SENSORS_PLI1209BC is not set
# CONFIG_SENSORS_PM6764TR is not set
# CONFIG_SENSORS_PXE1610 is not set
# CONFIG_SENSORS_Q54SJ108A2 is not set
# CONFIG_SENSORS_STPDDC60 is not set
# CONFIG_SENSORS_TPS40422 is not set
# CONFIG_SENSORS_TPS53679 is not set
CONFIG_SENSORS_UCD9000=3Dm
CONFIG_SENSORS_UCD9200=3Dm
# CONFIG_SENSORS_XDPE152 is not set
# CONFIG_SENSORS_XDPE122 is not set
CONFIG_SENSORS_ZL6100=3Dm
# CONFIG_SENSORS_PWM_FAN is not set
# CONFIG_SENSORS_SBTSI is not set
# CONFIG_SENSORS_SBRMI is not set
CONFIG_SENSORS_SHT15=3Dm
CONFIG_SENSORS_SHT21=3Dm
# CONFIG_SENSORS_SHT3x is not set
# CONFIG_SENSORS_SHT4x is not set
# CONFIG_SENSORS_SHTC1 is not set
CONFIG_SENSORS_SIS5595=3Dm
# CONFIG_SENSORS_SY7636A is not set
CONFIG_SENSORS_EMC1403=3Dm
# CONFIG_SENSORS_EMC2103 is not set
CONFIG_SENSORS_EMC6W201=3Dm
CONFIG_SENSORS_SMSC47M192=3Dm
# CONFIG_SENSORS_STTS751 is not set
# CONFIG_SENSORS_SMM665 is not set
# CONFIG_SENSORS_ADC128D818 is not set
CONFIG_SENSORS_ADS7828=3Dm
CONFIG_SENSORS_AMC6821=3Dm
CONFIG_SENSORS_INA209=3Dm
CONFIG_SENSORS_INA2XX=3Dm
# CONFIG_SENSORS_INA238 is not set
# CONFIG_SENSORS_INA3221 is not set
# CONFIG_SENSORS_TC74 is not set
CONFIG_SENSORS_THMC50=3Dm
CONFIG_SENSORS_TMP102=3Dm
# CONFIG_SENSORS_TMP103 is not set
# CONFIG_SENSORS_TMP108 is not set
CONFIG_SENSORS_TMP401=3Dm
CONFIG_SENSORS_TMP421=3Dm
# CONFIG_SENSORS_TMP464 is not set
# CONFIG_SENSORS_TMP513 is not set
CONFIG_SENSORS_VIA686A=3Dm
CONFIG_SENSORS_VT8231=3Dm
# CONFIG_SENSORS_W83773G is not set
CONFIG_SENSORS_W83781D=3Dm
CONFIG_SENSORS_W83791D=3Dm
CONFIG_SENSORS_W83792D=3Dm
CONFIG_SENSORS_W83793=3Dm
CONFIG_SENSORS_W83795=3Dm
# CONFIG_SENSORS_W83795_FANCTRL is not set
CONFIG_SENSORS_W83L785TS=3Dm
CONFIG_SENSORS_W83L786NG=3Dm
CONFIG_THERMAL=3Dy
# CONFIG_THERMAL_NETLINK is not set
# CONFIG_THERMAL_STATISTICS is not set
CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=3D0
CONFIG_THERMAL_HWMON=3Dy
CONFIG_THERMAL_OF=3Dy
# CONFIG_THERMAL_WRITABLE_TRIPS is not set
CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE=3Dy
# CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
# CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
CONFIG_THERMAL_GOV_FAIR_SHARE=3Dy
CONFIG_THERMAL_GOV_STEP_WISE=3Dy
# CONFIG_THERMAL_GOV_BANG_BANG is not set
# CONFIG_THERMAL_GOV_USER_SPACE is not set
# CONFIG_CPU_THERMAL is not set
# CONFIG_THERMAL_EMULATION is not set
# CONFIG_THERMAL_MMIO is not set
CONFIG_WATCHDOG=3Dy
CONFIG_WATCHDOG_CORE=3Dy
# CONFIG_WATCHDOG_NOWAYOUT is not set
CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED=3Dy
CONFIG_WATCHDOG_OPEN_TIMEOUT=3D0
CONFIG_WATCHDOG_SYSFS=3Dy
# CONFIG_WATCHDOG_HRTIMER_PRETIMEOUT is not set

#
# Watchdog Pretimeout Governors
#
# CONFIG_WATCHDOG_PRETIMEOUT_GOV is not set

#
# Watchdog Device Drivers
#
CONFIG_SOFT_WATCHDOG=3Dm
# CONFIG_GPIO_WATCHDOG is not set
# CONFIG_XILINX_WATCHDOG is not set
# CONFIG_ZIIRAVE_WATCHDOG is not set
# CONFIG_CADENCE_WATCHDOG is not set
# CONFIG_DW_WATCHDOG is not set
# CONFIG_MAX63XX_WATCHDOG is not set
CONFIG_ALIM7101_WDT=3Dm
CONFIG_I6300ESB_WDT=3Dm
# CONFIG_MEN_A21_WDT is not set
# CONFIG_PSERIES_WDT is not set
CONFIG_WATCHDOG_RTAS=3Dm

#
# PCI-based Watchdog Cards
#
CONFIG_PCIPCWATCHDOG=3Dm
CONFIG_WDTPCI=3Dm

#
# USB-based Watchdog Cards
#
CONFIG_USBPCWATCHDOG=3Dm
CONFIG_SSB_POSSIBLE=3Dy
# CONFIG_SSB is not set
CONFIG_BCMA_POSSIBLE=3Dy
CONFIG_BCMA=3Dm
CONFIG_BCMA_HOST_PCI_POSSIBLE=3Dy
CONFIG_BCMA_HOST_PCI=3Dy
# CONFIG_BCMA_HOST_SOC is not set
CONFIG_BCMA_DRIVER_PCI=3Dy
CONFIG_BCMA_DRIVER_GMAC_CMN=3Dy
CONFIG_BCMA_DRIVER_GPIO=3Dy
# CONFIG_BCMA_DEBUG is not set

#
# Multifunction device drivers
#
CONFIG_MFD_CORE=3Dm
# CONFIG_MFD_ACT8945A is not set
# CONFIG_MFD_AS3711 is not set
# CONFIG_MFD_AS3722 is not set
# CONFIG_PMIC_ADP5520 is not set
# CONFIG_MFD_AAT2870_CORE is not set
# CONFIG_MFD_ATMEL_FLEXCOM is not set
# CONFIG_MFD_ATMEL_HLCDC is not set
# CONFIG_MFD_BCM590XX is not set
# CONFIG_MFD_BD9571MWV is not set
# CONFIG_MFD_AXP20X_I2C is not set
# CONFIG_MFD_MADERA is not set
# CONFIG_PMIC_DA903X is not set
# CONFIG_MFD_DA9052_I2C is not set
# CONFIG_MFD_DA9055 is not set
# CONFIG_MFD_DA9062 is not set
# CONFIG_MFD_DA9063 is not set
# CONFIG_MFD_DA9150 is not set
# CONFIG_MFD_DLN2 is not set
# CONFIG_MFD_GATEWORKS_GSC is not set
# CONFIG_MFD_MC13XXX_I2C is not set
# CONFIG_MFD_MP2629 is not set
# CONFIG_MFD_HI6421_PMIC is not set
# CONFIG_HTC_PASIC3 is not set
# CONFIG_HTC_I2CPLD is not set
# CONFIG_LPC_ICH is not set
# CONFIG_LPC_SCH is not set
# CONFIG_MFD_IQS62X is not set
# CONFIG_MFD_JANZ_CMODIO is not set
# CONFIG_MFD_KEMPLD is not set
# CONFIG_MFD_88PM800 is not set
# CONFIG_MFD_88PM805 is not set
# CONFIG_MFD_88PM860X is not set
# CONFIG_MFD_MAX14577 is not set
# CONFIG_MFD_MAX77620 is not set
# CONFIG_MFD_MAX77650 is not set
# CONFIG_MFD_MAX77686 is not set
# CONFIG_MFD_MAX77693 is not set
# CONFIG_MFD_MAX77714 is not set
# CONFIG_MFD_MAX77843 is not set
# CONFIG_MFD_MAX8907 is not set
# CONFIG_MFD_MAX8925 is not set
# CONFIG_MFD_MAX8997 is not set
# CONFIG_MFD_MAX8998 is not set
# CONFIG_MFD_MT6360 is not set
# CONFIG_MFD_MT6397 is not set
# CONFIG_MFD_MENF21BMC is not set
CONFIG_MFD_VIPERBOARD=3Dm
# CONFIG_MFD_NTXEC is not set
# CONFIG_MFD_RETU is not set
# CONFIG_MFD_PCF50633 is not set
# CONFIG_UCB1400_CORE is not set
# CONFIG_MFD_RDC321X is not set
# CONFIG_MFD_RT4831 is not set
# CONFIG_MFD_RT5033 is not set
# CONFIG_MFD_RC5T583 is not set
# CONFIG_MFD_RK808 is not set
# CONFIG_MFD_RN5T618 is not set
# CONFIG_MFD_SEC_CORE is not set
# CONFIG_MFD_SI476X_CORE is not set
# CONFIG_MFD_SIMPLE_MFD_I2C is not set
CONFIG_MFD_SM501=3Dm
CONFIG_MFD_SM501_GPIO=3Dy
# CONFIG_MFD_SKY81452 is not set
# CONFIG_MFD_STMPE is not set
# CONFIG_MFD_SYSCON is not set
# CONFIG_MFD_TI_AM335X_TSCADC is not set
# CONFIG_MFD_LP3943 is not set
# CONFIG_MFD_LP8788 is not set
# CONFIG_MFD_TI_LMU is not set
# CONFIG_MFD_PALMAS is not set
# CONFIG_TPS6105X is not set
# CONFIG_TPS65010 is not set
# CONFIG_TPS6507X is not set
# CONFIG_MFD_TPS65086 is not set
# CONFIG_MFD_TPS65090 is not set
# CONFIG_MFD_TPS65217 is not set
# CONFIG_MFD_TI_LP873X is not set
# CONFIG_MFD_TI_LP87565 is not set
# CONFIG_MFD_TPS65218 is not set
# CONFIG_MFD_TPS6586X is not set
# CONFIG_MFD_TPS65910 is not set
# CONFIG_MFD_TPS65912_I2C is not set
# CONFIG_TWL4030_CORE is not set
# CONFIG_TWL6040_CORE is not set
# CONFIG_MFD_WL1273_CORE is not set
# CONFIG_MFD_LM3533 is not set
# CONFIG_MFD_TC3589X is not set
# CONFIG_MFD_TQMX86 is not set
CONFIG_MFD_VX855=3Dm
# CONFIG_MFD_LOCHNAGAR is not set
# CONFIG_MFD_ARIZONA_I2C is not set
# CONFIG_MFD_WM8400 is not set
# CONFIG_MFD_WM831X_I2C is not set
# CONFIG_MFD_WM8350_I2C is not set
# CONFIG_MFD_WM8994 is not set
# CONFIG_MFD_ROHM_BD718XX is not set
# CONFIG_MFD_ROHM_BD71828 is not set
# CONFIG_MFD_ROHM_BD957XMUF is not set
# CONFIG_MFD_STPMIC1 is not set
# CONFIG_MFD_STMFX is not set
# CONFIG_MFD_ATC260X_I2C is not set
# CONFIG_MFD_QCOM_PM8008 is not set
# CONFIG_MFD_RSMU_I2C is not set
# end of Multifunction device drivers

# CONFIG_REGULATOR is not set
CONFIG_RC_CORE=3Dm
CONFIG_LIRC=3Dy
CONFIG_RC_MAP=3Dm
CONFIG_RC_DECODERS=3Dy
CONFIG_IR_IMON_DECODER=3Dm
CONFIG_IR_JVC_DECODER=3Dm
CONFIG_IR_MCE_KBD_DECODER=3Dm
CONFIG_IR_NEC_DECODER=3Dm
CONFIG_IR_RC5_DECODER=3Dm
CONFIG_IR_RC6_DECODER=3Dm
# CONFIG_IR_RCMM_DECODER is not set
CONFIG_IR_SANYO_DECODER=3Dm
# CONFIG_IR_SHARP_DECODER is not set
CONFIG_IR_SONY_DECODER=3Dm
# CONFIG_IR_XMP_DECODER is not set
CONFIG_RC_DEVICES=3Dy
CONFIG_IR_GPIO_CIR=3Dm
CONFIG_IR_GPIO_TX=3Dm
# CONFIG_IR_HIX5HD2 is not set
# CONFIG_IR_IGORPLUGUSB is not set
CONFIG_IR_IGUANA=3Dm
CONFIG_IR_IMON=3Dm
CONFIG_IR_IMON_RAW=3Dm
CONFIG_IR_MCEUSB=3Dm
CONFIG_IR_PWM_TX=3Dm
CONFIG_IR_REDRAT3=3Dm
CONFIG_IR_SERIAL=3Dm
CONFIG_IR_SERIAL_TRANSMITTER=3Dy
CONFIG_IR_STREAMZAP=3Dm
# CONFIG_IR_TOY is not set
CONFIG_IR_TTUSBIR=3Dm
CONFIG_RC_ATI_REMOTE=3Dm
# CONFIG_RC_LOOPBACK is not set
# CONFIG_RC_XBOX_DVD is not set
CONFIG_CEC_CORE=3Dm

#
# CEC support
#
# CONFIG_MEDIA_CEC_RC is not set
CONFIG_MEDIA_CEC_SUPPORT=3Dy
# CONFIG_CEC_CH7322 is not set
CONFIG_USB_PULSE8_CEC=3Dm
CONFIG_USB_RAINSHADOW_CEC=3Dm
# end of CEC support

CONFIG_MEDIA_SUPPORT=3Dm
CONFIG_MEDIA_SUPPORT_FILTER=3Dy
CONFIG_MEDIA_SUBDRV_AUTOSELECT=3Dy

#
# Media device types
#
CONFIG_MEDIA_CAMERA_SUPPORT=3Dy
CONFIG_MEDIA_ANALOG_TV_SUPPORT=3Dy
CONFIG_MEDIA_DIGITAL_TV_SUPPORT=3Dy
CONFIG_MEDIA_RADIO_SUPPORT=3Dy
# CONFIG_MEDIA_SDR_SUPPORT is not set
# CONFIG_MEDIA_PLATFORM_SUPPORT is not set
# CONFIG_MEDIA_TEST_SUPPORT is not set
# end of Media device types

CONFIG_VIDEO_DEV=3Dm
CONFIG_MEDIA_CONTROLLER=3Dy
CONFIG_DVB_CORE=3Dm

#
# Video4Linux options
#
CONFIG_VIDEO_V4L2_I2C=3Dy
# CONFIG_VIDEO_ADV_DEBUG is not set
# CONFIG_VIDEO_FIXED_MINOR_RANGES is not set
CONFIG_VIDEO_TUNER=3Dm
CONFIG_V4L2_ASYNC=3Dm
CONFIG_VIDEOBUF_GEN=3Dm
CONFIG_VIDEOBUF_DMA_SG=3Dm
CONFIG_VIDEOBUF_VMALLOC=3Dm
# end of Video4Linux options

#
# Media controller options
#
CONFIG_MEDIA_CONTROLLER_DVB=3Dy
# end of Media controller options

#
# Digital TV options
#
# CONFIG_DVB_MMAP is not set
CONFIG_DVB_NET=3Dy
CONFIG_DVB_MAX_ADAPTERS=3D8
CONFIG_DVB_DYNAMIC_MINORS=3Dy
# CONFIG_DVB_DEMUX_SECTION_LOSS_LOG is not set
# CONFIG_DVB_ULE_DEBUG is not set
# end of Digital TV options

#
# Media drivers
#

#
# Drivers filtered as selected at 'Filter media drivers'
#

#
# Media drivers
#
CONFIG_MEDIA_USB_SUPPORT=3Dy

#
# Webcam devices
#
# CONFIG_VIDEO_CPIA2 is not set
CONFIG_USB_GSPCA=3Dm
CONFIG_USB_GSPCA_BENQ=3Dm
CONFIG_USB_GSPCA_CONEX=3Dm
CONFIG_USB_GSPCA_CPIA1=3Dm
# CONFIG_USB_GSPCA_DTCS033 is not set
CONFIG_USB_GSPCA_ETOMS=3Dm
CONFIG_USB_GSPCA_FINEPIX=3Dm
CONFIG_USB_GSPCA_JEILINJ=3Dm
CONFIG_USB_GSPCA_JL2005BCD=3Dm
# CONFIG_USB_GSPCA_KINECT is not set
CONFIG_USB_GSPCA_KONICA=3Dm
CONFIG_USB_GSPCA_MARS=3Dm
CONFIG_USB_GSPCA_MR97310A=3Dm
CONFIG_USB_GSPCA_NW80X=3Dm
CONFIG_USB_GSPCA_OV519=3Dm
CONFIG_USB_GSPCA_OV534=3Dm
CONFIG_USB_GSPCA_OV534_9=3Dm
CONFIG_USB_GSPCA_PAC207=3Dm
CONFIG_USB_GSPCA_PAC7302=3Dm
CONFIG_USB_GSPCA_PAC7311=3Dm
CONFIG_USB_GSPCA_SE401=3Dm
CONFIG_USB_GSPCA_SN9C2028=3Dm
CONFIG_USB_GSPCA_SN9C20X=3Dm
CONFIG_USB_GSPCA_SONIXB=3Dm
CONFIG_USB_GSPCA_SONIXJ=3Dm
CONFIG_USB_GSPCA_SPCA1528=3Dm
CONFIG_USB_GSPCA_SPCA500=3Dm
CONFIG_USB_GSPCA_SPCA501=3Dm
CONFIG_USB_GSPCA_SPCA505=3Dm
CONFIG_USB_GSPCA_SPCA506=3Dm
CONFIG_USB_GSPCA_SPCA508=3Dm
CONFIG_USB_GSPCA_SPCA561=3Dm
CONFIG_USB_GSPCA_SQ905=3Dm
CONFIG_USB_GSPCA_SQ905C=3Dm
CONFIG_USB_GSPCA_SQ930X=3Dm
CONFIG_USB_GSPCA_STK014=3Dm
# CONFIG_USB_GSPCA_STK1135 is not set
CONFIG_USB_GSPCA_STV0680=3Dm
CONFIG_USB_GSPCA_SUNPLUS=3Dm
CONFIG_USB_GSPCA_T613=3Dm
CONFIG_USB_GSPCA_TOPRO=3Dm
# CONFIG_USB_GSPCA_TOUPTEK is not set
CONFIG_USB_GSPCA_TV8532=3Dm
CONFIG_USB_GSPCA_VC032X=3Dm
CONFIG_USB_GSPCA_VICAM=3Dm
CONFIG_USB_GSPCA_XIRLINK_CIT=3Dm
CONFIG_USB_GSPCA_ZC3XX=3Dm
CONFIG_USB_GL860=3Dm
CONFIG_USB_M5602=3Dm
CONFIG_USB_STV06XX=3Dm
CONFIG_USB_PWC=3Dm
# CONFIG_USB_PWC_DEBUG is not set
CONFIG_USB_PWC_INPUT_EVDEV=3Dy
CONFIG_USB_S2255=3Dm
# CONFIG_VIDEO_USBTV is not set
CONFIG_USB_VIDEO_CLASS=3Dm
CONFIG_USB_VIDEO_CLASS_INPUT_EVDEV=3Dy
CONFIG_USB_ZR364XX=3Dm

#
# Analog TV USB devices
#
# CONFIG_VIDEO_GO7007 is not set
CONFIG_VIDEO_HDPVR=3Dm
CONFIG_VIDEO_PVRUSB2=3Dm
CONFIG_VIDEO_PVRUSB2_SYSFS=3Dy
CONFIG_VIDEO_PVRUSB2_DVB=3Dy
# CONFIG_VIDEO_PVRUSB2_DEBUGIFC is not set
# CONFIG_VIDEO_STK1160_COMMON is not set

#
# Analog/digital TV USB devices
#
CONFIG_VIDEO_AU0828=3Dm
CONFIG_VIDEO_AU0828_V4L2=3Dy
# CONFIG_VIDEO_AU0828_RC is not set
CONFIG_VIDEO_CX231XX=3Dm
CONFIG_VIDEO_CX231XX_RC=3Dy
CONFIG_VIDEO_CX231XX_ALSA=3Dm
CONFIG_VIDEO_CX231XX_DVB=3Dm
CONFIG_VIDEO_TM6000=3Dm
CONFIG_VIDEO_TM6000_ALSA=3Dm
CONFIG_VIDEO_TM6000_DVB=3Dm

#
# Digital TV USB devices
#
# CONFIG_DVB_AS102 is not set
CONFIG_DVB_B2C2_FLEXCOP_USB=3Dm
# CONFIG_DVB_B2C2_FLEXCOP_USB_DEBUG is not set
CONFIG_DVB_USB_V2=3Dm
CONFIG_DVB_USB_AF9015=3Dm
CONFIG_DVB_USB_AF9035=3Dm
CONFIG_DVB_USB_ANYSEE=3Dm
CONFIG_DVB_USB_AU6610=3Dm
CONFIG_DVB_USB_AZ6007=3Dm
CONFIG_DVB_USB_CE6230=3Dm
# CONFIG_DVB_USB_DVBSKY is not set
CONFIG_DVB_USB_EC168=3Dm
CONFIG_DVB_USB_GL861=3Dm
CONFIG_DVB_USB_LME2510=3Dm
CONFIG_DVB_USB_MXL111SF=3Dm
CONFIG_DVB_USB_RTL28XXU=3Dm
# CONFIG_DVB_USB_ZD1301 is not set
CONFIG_DVB_USB=3Dm
# CONFIG_DVB_USB_DEBUG is not set
CONFIG_DVB_USB_A800=3Dm
CONFIG_DVB_USB_AF9005=3Dm
CONFIG_DVB_USB_AF9005_REMOTE=3Dm
CONFIG_DVB_USB_AZ6027=3Dm
CONFIG_DVB_USB_CINERGY_T2=3Dm
CONFIG_DVB_USB_CXUSB=3Dm
# CONFIG_DVB_USB_CXUSB_ANALOG is not set
CONFIG_DVB_USB_DIB0700=3Dm
CONFIG_DVB_USB_DIB3000MC=3Dm
CONFIG_DVB_USB_DIBUSB_MB=3Dm
# CONFIG_DVB_USB_DIBUSB_MB_FAULTY is not set
CONFIG_DVB_USB_DIBUSB_MC=3Dm
CONFIG_DVB_USB_DIGITV=3Dm
CONFIG_DVB_USB_DTT200U=3Dm
CONFIG_DVB_USB_DTV5100=3Dm
CONFIG_DVB_USB_DW2102=3Dm
CONFIG_DVB_USB_GP8PSK=3Dm
CONFIG_DVB_USB_M920X=3Dm
CONFIG_DVB_USB_NOVA_T_USB2=3Dm
CONFIG_DVB_USB_OPERA1=3Dm
CONFIG_DVB_USB_PCTV452E=3Dm
CONFIG_DVB_USB_TECHNISAT_USB2=3Dm
CONFIG_DVB_USB_TTUSB2=3Dm
CONFIG_DVB_USB_UMT_010=3Dm
CONFIG_DVB_USB_VP702X=3Dm
CONFIG_DVB_USB_VP7045=3Dm
CONFIG_SMS_USB_DRV=3Dm
CONFIG_DVB_TTUSB_BUDGET=3Dm
CONFIG_DVB_TTUSB_DEC=3Dm

#
# Webcam, TV (analog/digital) USB devices
#
CONFIG_VIDEO_EM28XX=3Dm
# CONFIG_VIDEO_EM28XX_V4L2 is not set
CONFIG_VIDEO_EM28XX_ALSA=3Dm
CONFIG_VIDEO_EM28XX_DVB=3Dm
CONFIG_VIDEO_EM28XX_RC=3Dm
CONFIG_MEDIA_PCI_SUPPORT=3Dy

#
# Media capture support
#
# CONFIG_VIDEO_SOLO6X10 is not set
# CONFIG_VIDEO_TW5864 is not set
# CONFIG_VIDEO_TW68 is not set
# CONFIG_VIDEO_TW686X is not set

#
# Media capture/analog TV support
#
# CONFIG_VIDEO_DT3155 is not set
CONFIG_VIDEO_IVTV=3Dm
# CONFIG_VIDEO_IVTV_ALSA is not set
CONFIG_VIDEO_FB_IVTV=3Dm
# CONFIG_VIDEO_HEXIUM_GEMINI is not set
# CONFIG_VIDEO_HEXIUM_ORION is not set
# CONFIG_VIDEO_MXB is not set

#
# Media capture/analog/hybrid TV support
#
CONFIG_VIDEO_BT848=3Dm
CONFIG_DVB_BT8XX=3Dm
CONFIG_VIDEO_CX18=3Dm
CONFIG_VIDEO_CX18_ALSA=3Dm
CONFIG_VIDEO_CX23885=3Dm
CONFIG_MEDIA_ALTERA_CI=3Dm
# CONFIG_VIDEO_CX25821 is not set
CONFIG_VIDEO_CX88=3Dm
CONFIG_VIDEO_CX88_ALSA=3Dm
CONFIG_VIDEO_CX88_BLACKBIRD=3Dm
CONFIG_VIDEO_CX88_DVB=3Dm
# CONFIG_VIDEO_CX88_ENABLE_VP3054 is not set
CONFIG_VIDEO_CX88_MPEG=3Dm
CONFIG_VIDEO_SAA7134=3Dm
CONFIG_VIDEO_SAA7134_ALSA=3Dm
CONFIG_VIDEO_SAA7134_RC=3Dy
CONFIG_VIDEO_SAA7134_DVB=3Dm
CONFIG_VIDEO_SAA7164=3Dm

#
# Media digital TV PCI Adapters
#
CONFIG_DVB_B2C2_FLEXCOP_PCI=3Dm
# CONFIG_DVB_B2C2_FLEXCOP_PCI_DEBUG is not set
CONFIG_DVB_DDBRIDGE=3Dm
# CONFIG_DVB_DDBRIDGE_MSIENABLE is not set
CONFIG_DVB_DM1105=3Dm
CONFIG_MANTIS_CORE=3Dm
CONFIG_DVB_MANTIS=3Dm
CONFIG_DVB_HOPPER=3Dm
CONFIG_DVB_NGENE=3Dm
CONFIG_DVB_PLUTO2=3Dm
CONFIG_DVB_PT1=3Dm
# CONFIG_DVB_PT3 is not set
# CONFIG_DVB_SMIPCIE is not set
CONFIG_DVB_BUDGET_CORE=3Dm
CONFIG_DVB_BUDGET=3Dm
CONFIG_DVB_BUDGET_CI=3Dm
CONFIG_DVB_BUDGET_AV=3Dm
CONFIG_RADIO_ADAPTERS=3Dm
# CONFIG_RADIO_MAXIRADIO is not set
# CONFIG_RADIO_SAA7706H is not set
# CONFIG_RADIO_SHARK is not set
# CONFIG_RADIO_SHARK2 is not set
# CONFIG_RADIO_SI4713 is not set
CONFIG_RADIO_TEA575X=3Dm
# CONFIG_RADIO_TEA5764 is not set
# CONFIG_RADIO_TEF6862 is not set
# CONFIG_RADIO_WL1273 is not set
# CONFIG_USB_DSBR is not set
# CONFIG_USB_KEENE is not set
# CONFIG_USB_MA901 is not set
# CONFIG_USB_MR800 is not set
# CONFIG_USB_RAREMONO is not set
# CONFIG_RADIO_SI470X is not set

#
# FireWire (IEEE 1394) Adapters
#
CONFIG_DVB_FIREDTV=3Dm
CONFIG_DVB_FIREDTV_INPUT=3Dy
CONFIG_MEDIA_COMMON_OPTIONS=3Dy

#
# common driver options
#
CONFIG_CYPRESS_FIRMWARE=3Dm
CONFIG_TTPCI_EEPROM=3Dm
CONFIG_VIDEO_CX2341X=3Dm
CONFIG_VIDEO_TVEEPROM=3Dm
CONFIG_DVB_B2C2_FLEXCOP=3Dm
CONFIG_VIDEO_SAA7146=3Dm
CONFIG_VIDEO_SAA7146_VV=3Dm
CONFIG_SMS_SIANO_MDTV=3Dm
CONFIG_SMS_SIANO_RC=3Dy
CONFIG_VIDEOBUF2_CORE=3Dm
CONFIG_VIDEOBUF2_V4L2=3Dm
CONFIG_VIDEOBUF2_MEMOPS=3Dm
CONFIG_VIDEOBUF2_VMALLOC=3Dm
CONFIG_VIDEOBUF2_DMA_SG=3Dm
CONFIG_VIDEOBUF2_DVB=3Dm
# end of Media drivers

CONFIG_MEDIA_HIDE_ANCILLARY_SUBDRV=3Dy

#
# Media ancillary drivers
#
CONFIG_MEDIA_ATTACH=3Dy

#
# IR I2C driver auto-selected by 'Autoselect ancillary drivers'
#
CONFIG_VIDEO_IR_I2C=3Dm

#
# Camera sensor devices
#
# CONFIG_VIDEO_AR0521 is not set
# CONFIG_VIDEO_HI556 is not set
# CONFIG_VIDEO_HI846 is not set
# CONFIG_VIDEO_HI847 is not set
# CONFIG_VIDEO_IMX208 is not set
# CONFIG_VIDEO_IMX214 is not set
# CONFIG_VIDEO_IMX219 is not set
# CONFIG_VIDEO_IMX258 is not set
# CONFIG_VIDEO_IMX274 is not set
# CONFIG_VIDEO_IMX290 is not set
# CONFIG_VIDEO_IMX319 is not set
# CONFIG_VIDEO_IMX334 is not set
# CONFIG_VIDEO_IMX335 is not set
# CONFIG_VIDEO_IMX355 is not set
# CONFIG_VIDEO_IMX412 is not set
# CONFIG_VIDEO_MT9M001 is not set
# CONFIG_VIDEO_MT9M032 is not set
# CONFIG_VIDEO_MT9M111 is not set
# CONFIG_VIDEO_MT9P031 is not set
# CONFIG_VIDEO_MT9T001 is not set
# CONFIG_VIDEO_MT9T112 is not set
# CONFIG_VIDEO_MT9V011 is not set
# CONFIG_VIDEO_MT9V032 is not set
# CONFIG_VIDEO_MT9V111 is not set
# CONFIG_VIDEO_NOON010PC30 is not set
# CONFIG_VIDEO_OG01A1B is not set
# CONFIG_VIDEO_OV02A10 is not set
# CONFIG_VIDEO_OV08D10 is not set
# CONFIG_VIDEO_OV13858 is not set
# CONFIG_VIDEO_OV13B10 is not set
# CONFIG_VIDEO_OV2640 is not set
# CONFIG_VIDEO_OV2659 is not set
# CONFIG_VIDEO_OV2680 is not set
# CONFIG_VIDEO_OV2685 is not set
# CONFIG_VIDEO_OV5640 is not set
# CONFIG_VIDEO_OV5645 is not set
# CONFIG_VIDEO_OV5647 is not set
# CONFIG_VIDEO_OV5648 is not set
# CONFIG_VIDEO_OV5670 is not set
# CONFIG_VIDEO_OV5675 is not set
# CONFIG_VIDEO_OV5693 is not set
# CONFIG_VIDEO_OV5695 is not set
# CONFIG_VIDEO_OV6650 is not set
# CONFIG_VIDEO_OV7251 is not set
# CONFIG_VIDEO_OV7640 is not set
# CONFIG_VIDEO_OV7670 is not set
# CONFIG_VIDEO_OV772X is not set
# CONFIG_VIDEO_OV7740 is not set
# CONFIG_VIDEO_OV8856 is not set
# CONFIG_VIDEO_OV8865 is not set
# CONFIG_VIDEO_OV9282 is not set
# CONFIG_VIDEO_OV9640 is not set
# CONFIG_VIDEO_OV9650 is not set
# CONFIG_VIDEO_RDACM20 is not set
# CONFIG_VIDEO_RDACM21 is not set
# CONFIG_VIDEO_RJ54N1 is not set
# CONFIG_VIDEO_S5K4ECGX is not set
# CONFIG_VIDEO_S5K5BAF is not set
# CONFIG_VIDEO_S5K6A3 is not set
# CONFIG_VIDEO_S5K6AA is not set
# CONFIG_VIDEO_SR030PC30 is not set
# CONFIG_VIDEO_VS6624 is not set
# CONFIG_VIDEO_ET8EK8 is not set
# CONFIG_VIDEO_M5MOLS is not set
# end of Camera sensor devices

#
# Lens drivers
#
# CONFIG_VIDEO_AD5820 is not set
# CONFIG_VIDEO_AK7375 is not set
# CONFIG_VIDEO_DW9714 is not set
# CONFIG_VIDEO_DW9768 is not set
# CONFIG_VIDEO_DW9807_VCM is not set
# end of Lens drivers

#
# Flash devices
#
# CONFIG_VIDEO_ADP1653 is not set
# CONFIG_VIDEO_LM3560 is not set
# CONFIG_VIDEO_LM3646 is not set
# end of Flash devices

#
# audio, video and radio I2C drivers auto-selected by 'Autoselect =
ancillary drivers'
#
CONFIG_VIDEO_CS3308=3Dm
CONFIG_VIDEO_CS5345=3Dm
CONFIG_VIDEO_CS53L32A=3Dm
CONFIG_VIDEO_MSP3400=3Dm
CONFIG_VIDEO_TDA7432=3Dm
CONFIG_VIDEO_TVAUDIO=3Dm
CONFIG_VIDEO_VP27SMPX=3Dm
CONFIG_VIDEO_WM8739=3Dm
CONFIG_VIDEO_WM8775=3Dm
CONFIG_VIDEO_SAA6588=3Dm
CONFIG_VIDEO_SAA711X=3Dm

#
# Video and audio decoders
#
CONFIG_VIDEO_SAA717X=3Dm
CONFIG_VIDEO_CX25840=3Dm
CONFIG_VIDEO_SAA7127=3Dm
CONFIG_VIDEO_UPD64031A=3Dm
CONFIG_VIDEO_UPD64083=3Dm
CONFIG_VIDEO_SAA6752HS=3Dm
CONFIG_VIDEO_M52790=3Dm
CONFIG_MEDIA_TUNER=3Dm

#
# Tuner drivers auto-selected by 'Autoselect ancillary drivers'
#
CONFIG_MEDIA_TUNER_E4000=3Dm
CONFIG_MEDIA_TUNER_FC0011=3Dm
CONFIG_MEDIA_TUNER_FC0012=3Dm
CONFIG_MEDIA_TUNER_FC0013=3Dm
CONFIG_MEDIA_TUNER_FC2580=3Dm
CONFIG_MEDIA_TUNER_IT913X=3Dm
CONFIG_MEDIA_TUNER_M88RS6000T=3Dm
CONFIG_MEDIA_TUNER_MAX2165=3Dm
CONFIG_MEDIA_TUNER_MC44S803=3Dm
CONFIG_MEDIA_TUNER_MT2060=3Dm
CONFIG_MEDIA_TUNER_MT2063=3Dm
CONFIG_MEDIA_TUNER_MT20XX=3Dm
CONFIG_MEDIA_TUNER_MT2131=3Dm
CONFIG_MEDIA_TUNER_MT2266=3Dm
CONFIG_MEDIA_TUNER_MXL5005S=3Dm
CONFIG_MEDIA_TUNER_MXL5007T=3Dm
CONFIG_MEDIA_TUNER_QM1D1B0004=3Dm
CONFIG_MEDIA_TUNER_QM1D1C0042=3Dm
CONFIG_MEDIA_TUNER_QT1010=3Dm
CONFIG_MEDIA_TUNER_R820T=3Dm
CONFIG_MEDIA_TUNER_SI2157=3Dm
CONFIG_MEDIA_TUNER_SIMPLE=3Dm
CONFIG_MEDIA_TUNER_TDA18212=3Dm
CONFIG_MEDIA_TUNER_TDA18218=3Dm
CONFIG_MEDIA_TUNER_TDA18250=3Dm
CONFIG_MEDIA_TUNER_TDA18271=3Dm
CONFIG_MEDIA_TUNER_TDA827X=3Dm
CONFIG_MEDIA_TUNER_TDA8290=3Dm
CONFIG_MEDIA_TUNER_TDA9887=3Dm
CONFIG_MEDIA_TUNER_TEA5761=3Dm
CONFIG_MEDIA_TUNER_TEA5767=3Dm
CONFIG_MEDIA_TUNER_TUA9001=3Dm
CONFIG_MEDIA_TUNER_XC2028=3Dm
CONFIG_MEDIA_TUNER_XC4000=3Dm
CONFIG_MEDIA_TUNER_XC5000=3Dm

#
# DVB Frontend drivers auto-selected by 'Autoselect ancillary drivers'
#

#
# Multistandard (satellite) frontends
#
CONFIG_DVB_M88DS3103=3Dm
CONFIG_DVB_MXL5XX=3Dm
CONFIG_DVB_STB0899=3Dm
CONFIG_DVB_STB6100=3Dm
CONFIG_DVB_STV090x=3Dm
CONFIG_DVB_STV0910=3Dm
CONFIG_DVB_STV6110x=3Dm
CONFIG_DVB_STV6111=3Dm

#
# Multistandard (cable + terrestrial) frontends
#
CONFIG_DVB_DRXK=3Dm
CONFIG_DVB_MN88472=3Dm
CONFIG_DVB_MN88473=3Dm
CONFIG_DVB_SI2165=3Dm
CONFIG_DVB_TDA18271C2DD=3Dm

#
# DVB-S (satellite) frontends
#
CONFIG_DVB_CX24110=3Dm
CONFIG_DVB_CX24116=3Dm
CONFIG_DVB_CX24117=3Dm
CONFIG_DVB_CX24120=3Dm
CONFIG_DVB_CX24123=3Dm
CONFIG_DVB_DS3000=3Dm
CONFIG_DVB_MB86A16=3Dm
CONFIG_DVB_MT312=3Dm
CONFIG_DVB_S5H1420=3Dm
CONFIG_DVB_SI21XX=3Dm
CONFIG_DVB_STB6000=3Dm
CONFIG_DVB_STV0288=3Dm
CONFIG_DVB_STV0299=3Dm
CONFIG_DVB_STV0900=3Dm
CONFIG_DVB_STV6110=3Dm
CONFIG_DVB_TDA10071=3Dm
CONFIG_DVB_TDA10086=3Dm
CONFIG_DVB_TDA8083=3Dm
CONFIG_DVB_TDA8261=3Dm
CONFIG_DVB_TDA826X=3Dm
CONFIG_DVB_TS2020=3Dm
CONFIG_DVB_TUA6100=3Dm
CONFIG_DVB_TUNER_CX24113=3Dm
CONFIG_DVB_TUNER_ITD1000=3Dm
CONFIG_DVB_VES1X93=3Dm
CONFIG_DVB_ZL10036=3Dm
CONFIG_DVB_ZL10039=3Dm

#
# DVB-T (terrestrial) frontends
#
CONFIG_DVB_AF9013=3Dm
CONFIG_DVB_CX22700=3Dm
CONFIG_DVB_CX22702=3Dm
CONFIG_DVB_CXD2820R=3Dm
CONFIG_DVB_CXD2841ER=3Dm
CONFIG_DVB_DIB3000MB=3Dm
CONFIG_DVB_DIB3000MC=3Dm
CONFIG_DVB_DIB7000M=3Dm
CONFIG_DVB_DIB7000P=3Dm
CONFIG_DVB_DRXD=3Dm
CONFIG_DVB_EC100=3Dm
CONFIG_DVB_GP8PSK_FE=3Dm
CONFIG_DVB_L64781=3Dm
CONFIG_DVB_MT352=3Dm
CONFIG_DVB_NXT6000=3Dm
CONFIG_DVB_RTL2830=3Dm
CONFIG_DVB_RTL2832=3Dm
CONFIG_DVB_SI2168=3Dm
CONFIG_DVB_SP887X=3Dm
CONFIG_DVB_STV0367=3Dm
CONFIG_DVB_TDA10048=3Dm
CONFIG_DVB_TDA1004X=3Dm
CONFIG_DVB_ZL10353=3Dm

#
# DVB-C (cable) frontends
#
CONFIG_DVB_STV0297=3Dm
CONFIG_DVB_TDA10021=3Dm
CONFIG_DVB_TDA10023=3Dm
CONFIG_DVB_VES1820=3Dm

#
# ATSC (North American/Korean Terrestrial/Cable DTV) frontends
#
CONFIG_DVB_AU8522=3Dm
CONFIG_DVB_AU8522_DTV=3Dm
CONFIG_DVB_AU8522_V4L=3Dm
CONFIG_DVB_BCM3510=3Dm
CONFIG_DVB_LG2160=3Dm
CONFIG_DVB_LGDT3305=3Dm
CONFIG_DVB_LGDT3306A=3Dm
CONFIG_DVB_LGDT330X=3Dm
CONFIG_DVB_MXL692=3Dm
CONFIG_DVB_NXT200X=3Dm
CONFIG_DVB_OR51132=3Dm
CONFIG_DVB_OR51211=3Dm
CONFIG_DVB_S5H1409=3Dm
CONFIG_DVB_S5H1411=3Dm

#
# ISDB-T (terrestrial) frontends
#
CONFIG_DVB_DIB8000=3Dm
CONFIG_DVB_MB86A20S=3Dm
CONFIG_DVB_S921=3Dm

#
# ISDB-S (satellite) & ISDB-T (terrestrial) frontends
#
CONFIG_DVB_TC90522=3Dm

#
# Digital terrestrial only tuners/PLL
#
CONFIG_DVB_PLL=3Dm
CONFIG_DVB_TUNER_DIB0070=3Dm
CONFIG_DVB_TUNER_DIB0090=3Dm

#
# SEC control devices for DVB-S
#
CONFIG_DVB_A8293=3Dm
CONFIG_DVB_AF9033=3Dm
CONFIG_DVB_ATBM8830=3Dm
CONFIG_DVB_ISL6405=3Dm
CONFIG_DVB_ISL6421=3Dm
CONFIG_DVB_ISL6423=3Dm
CONFIG_DVB_IX2505V=3Dm
CONFIG_DVB_LGS8GXX=3Dm
CONFIG_DVB_LNBH25=3Dm
CONFIG_DVB_LNBP21=3Dm
CONFIG_DVB_LNBP22=3Dm
CONFIG_DVB_M88RS2000=3Dm
CONFIG_DVB_TDA665x=3Dm
CONFIG_DVB_DRX39XYJ=3Dm

#
# Common Interface (EN50221) controller drivers
#
CONFIG_DVB_CXD2099=3Dm
# end of Media ancillary drivers

#
# Graphics support
#
CONFIG_APERTURE_HELPERS=3Dy
# CONFIG_AGP is not set
CONFIG_DRM=3Dm
# CONFIG_DRM_DEBUG_SELFTEST is not set
CONFIG_DRM_KMS_HELPER=3Dm
CONFIG_DRM_FBDEV_EMULATION=3Dy
CONFIG_DRM_FBDEV_OVERALLOC=3D100
CONFIG_DRM_LOAD_EDID_FIRMWARE=3Dy
CONFIG_DRM_DISPLAY_HELPER=3Dm
CONFIG_DRM_DISPLAY_DP_HELPER=3Dy
CONFIG_DRM_DISPLAY_HDMI_HELPER=3Dy
CONFIG_DRM_DP_AUX_CHARDEV=3Dy
# CONFIG_DRM_DP_CEC is not set
CONFIG_DRM_TTM=3Dm
CONFIG_DRM_BUDDY=3Dm
CONFIG_DRM_VRAM_HELPER=3Dm
CONFIG_DRM_TTM_HELPER=3Dm
CONFIG_DRM_GEM_SHMEM_HELPER=3Dm
CONFIG_DRM_SCHED=3Dm

#
# I2C encoder or helper chips
#
CONFIG_DRM_I2C_CH7006=3Dm
CONFIG_DRM_I2C_SIL164=3Dm
# CONFIG_DRM_I2C_NXP_TDA998X is not set
# CONFIG_DRM_I2C_NXP_TDA9950 is not set
# end of I2C encoder or helper chips

#
# ARM devices
#
# end of ARM devices

CONFIG_DRM_RADEON=3Dm
CONFIG_DRM_RADEON_USERPTR=3Dy
CONFIG_DRM_AMDGPU=3Dm
# CONFIG_DRM_AMDGPU_SI is not set
# CONFIG_DRM_AMDGPU_CIK is not set
CONFIG_DRM_AMDGPU_USERPTR=3Dy

#
# ACP (Audio CoProcessor) Configuration
#
CONFIG_DRM_AMD_ACP=3Dy
# end of ACP (Audio CoProcessor) Configuration

#
# Display Engine Configuration
#
CONFIG_DRM_AMD_DC=3Dy
CONFIG_DRM_AMD_DC_DCN=3Dy
# CONFIG_DRM_AMD_DC_HDCP is not set
# CONFIG_DEBUG_KERNEL_DC is not set
# CONFIG_DRM_AMD_SECURE_DISPLAY is not set
# end of Display Engine Configuration

CONFIG_HSA_AMD=3Dy
CONFIG_HSA_AMD_SVM=3Dy
CONFIG_DRM_NOUVEAU=3Dm
# CONFIG_NOUVEAU_LEGACY_CTX_SUPPORT is not set
CONFIG_NOUVEAU_DEBUG=3D5
CONFIG_NOUVEAU_DEBUG_DEFAULT=3D3
# CONFIG_NOUVEAU_DEBUG_MMU is not set
# CONFIG_NOUVEAU_DEBUG_PUSH is not set
CONFIG_DRM_NOUVEAU_BACKLIGHT=3Dy
# CONFIG_DRM_VGEM is not set
CONFIG_DRM_VKMS=3Dm
CONFIG_DRM_UDL=3Dm
CONFIG_DRM_AST=3Dm
CONFIG_DRM_MGAG200=3Dm
# CONFIG_DRM_RCAR_DW_HDMI is not set
# CONFIG_DRM_RCAR_USE_LVDS is not set
# CONFIG_DRM_RCAR_MIPI_DSI is not set
CONFIG_DRM_QXL=3Dm
CONFIG_DRM_VIRTIO_GPU=3Dm
CONFIG_DRM_PANEL=3Dy

#
# Display Panels
#
# CONFIG_DRM_PANEL_LVDS is not set
# CONFIG_DRM_PANEL_SIMPLE is not set
# CONFIG_DRM_PANEL_EDP is not set
# CONFIG_DRM_PANEL_OLIMEX_LCD_OLINUXINO is not set
# CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20 is not set
# CONFIG_DRM_PANEL_SAMSUNG_S6E63M0 is not set
# CONFIG_DRM_PANEL_SAMSUNG_S6E88A0_AMS452EF01 is not set
# CONFIG_DRM_PANEL_SAMSUNG_S6E8AA0 is not set
# CONFIG_DRM_PANEL_SEIKO_43WVF1G is not set
# end of Display Panels

CONFIG_DRM_BRIDGE=3Dy
CONFIG_DRM_PANEL_BRIDGE=3Dy

#
# Display Interface Bridges
#
# CONFIG_DRM_CDNS_DSI is not set
# CONFIG_DRM_CHIPONE_ICN6211 is not set
# CONFIG_DRM_CHRONTEL_CH7033 is not set
# CONFIG_DRM_DISPLAY_CONNECTOR is not set
# CONFIG_DRM_ITE_IT6505 is not set
# CONFIG_DRM_LONTIUM_LT8912B is not set
# CONFIG_DRM_LONTIUM_LT9211 is not set
# CONFIG_DRM_LONTIUM_LT9611 is not set
# CONFIG_DRM_LONTIUM_LT9611UXC is not set
# CONFIG_DRM_ITE_IT66121 is not set
# CONFIG_DRM_LVDS_CODEC is not set
# CONFIG_DRM_MEGACHIPS_STDPXXXX_GE_B850V3_FW is not set
# CONFIG_DRM_NXP_PTN3460 is not set
# CONFIG_DRM_PARADE_PS8622 is not set
# CONFIG_DRM_PARADE_PS8640 is not set
# CONFIG_DRM_SIL_SII8620 is not set
# CONFIG_DRM_SII902X is not set
# CONFIG_DRM_SII9234 is not set
# CONFIG_DRM_SIMPLE_BRIDGE is not set
# CONFIG_DRM_THINE_THC63LVD1024 is not set
# CONFIG_DRM_TOSHIBA_TC358762 is not set
# CONFIG_DRM_TOSHIBA_TC358764 is not set
# CONFIG_DRM_TOSHIBA_TC358767 is not set
# CONFIG_DRM_TOSHIBA_TC358768 is not set
# CONFIG_DRM_TOSHIBA_TC358775 is not set
# CONFIG_DRM_TI_DLPC3433 is not set
# CONFIG_DRM_TI_TFP410 is not set
# CONFIG_DRM_TI_SN65DSI83 is not set
# CONFIG_DRM_TI_SN65DSI86 is not set
# CONFIG_DRM_TI_TPD12S015 is not set
# CONFIG_DRM_ANALOGIX_ANX6345 is not set
# CONFIG_DRM_ANALOGIX_ANX78XX is not set
# CONFIG_DRM_ANALOGIX_ANX7625 is not set
# CONFIG_DRM_I2C_ADV7511 is not set
# CONFIG_DRM_CDNS_MHDP8546 is not set
# end of Display Interface Bridges

# CONFIG_DRM_ETNAVIV is not set
# CONFIG_DRM_LOGICVC is not set
# CONFIG_DRM_ARCPGU is not set
CONFIG_DRM_BOCHS=3Dm
CONFIG_DRM_CIRRUS_QEMU=3Dm
# CONFIG_DRM_GM12U320 is not set
# CONFIG_DRM_SIMPLEDRM is not set
# CONFIG_DRM_GUD is not set
# CONFIG_DRM_SSD130X is not set
# CONFIG_DRM_LEGACY is not set
CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=3Dm
CONFIG_DRM_NOMODESET=3Dy

#
# Frame buffer Devices
#
CONFIG_FB_CMDLINE=3Dy
CONFIG_FB_NOTIFY=3Dy
CONFIG_FB=3Dy
# CONFIG_FIRMWARE_EDID is not set
CONFIG_FB_CFB_FILLRECT=3Dy
CONFIG_FB_CFB_COPYAREA=3Dy
CONFIG_FB_CFB_IMAGEBLIT=3Dy
CONFIG_FB_SYS_FILLRECT=3Dm
CONFIG_FB_SYS_COPYAREA=3Dm
CONFIG_FB_SYS_IMAGEBLIT=3Dm
# CONFIG_FB_FOREIGN_ENDIAN is not set
CONFIG_FB_SYS_FOPS=3Dm
CONFIG_FB_DEFERRED_IO=3Dy
CONFIG_FB_MACMODES=3Dy
CONFIG_FB_BACKLIGHT=3Dm
CONFIG_FB_MODE_HELPERS=3Dy
CONFIG_FB_TILEBLITTING=3Dy

#
# Frame buffer hardware drivers
#
# CONFIG_FB_CIRRUS is not set
# CONFIG_FB_PM2 is not set
# CONFIG_FB_CYBER2000 is not set
CONFIG_FB_OF=3Dy
# CONFIG_FB_ASILIANT is not set
# CONFIG_FB_IMSTT is not set
CONFIG_FB_VGA16=3Dm
# CONFIG_FB_UVESA is not set
# CONFIG_FB_OPENCORES is not set
# CONFIG_FB_S1D13XXX is not set
CONFIG_FB_NVIDIA=3Dm
# CONFIG_FB_NVIDIA_I2C is not set
# CONFIG_FB_NVIDIA_DEBUG is not set
CONFIG_FB_NVIDIA_BACKLIGHT=3Dy
# CONFIG_FB_RIVA is not set
# CONFIG_FB_I740 is not set
CONFIG_FB_MATROX=3Dy
# CONFIG_FB_MATROX_MILLENIUM is not set
# CONFIG_FB_MATROX_MYSTIQUE is not set
CONFIG_FB_MATROX_G=3Dy
# CONFIG_FB_MATROX_I2C is not set
CONFIG_FB_RADEON=3Dm
# CONFIG_FB_RADEON_I2C is not set
CONFIG_FB_RADEON_BACKLIGHT=3Dy
# CONFIG_FB_RADEON_DEBUG is not set
# CONFIG_FB_ATY128 is not set
# CONFIG_FB_ATY is not set
# CONFIG_FB_S3 is not set
# CONFIG_FB_SAVAGE is not set
# CONFIG_FB_SIS is not set
# CONFIG_FB_NEOMAGIC is not set
# CONFIG_FB_KYRO is not set
# CONFIG_FB_3DFX is not set
# CONFIG_FB_VOODOO1 is not set
# CONFIG_FB_VT8623 is not set
# CONFIG_FB_TRIDENT is not set
# CONFIG_FB_ARK is not set
# CONFIG_FB_PM3 is not set
# CONFIG_FB_CARMINE is not set
# CONFIG_FB_SM501 is not set
# CONFIG_FB_SMSCUFX is not set
# CONFIG_FB_UDL is not set
CONFIG_FB_IBM_GXT4500=3Dy
# CONFIG_FB_VIRTUAL is not set
# CONFIG_FB_METRONOME is not set
# CONFIG_FB_MB862XX is not set
# CONFIG_FB_SIMPLE is not set
CONFIG_FB_SSD1307=3Dm
# CONFIG_FB_SM712 is not set
# end of Frame buffer Devices

#
# Backlight & LCD device support
#
CONFIG_LCD_CLASS_DEVICE=3Dm
CONFIG_LCD_PLATFORM=3Dm
CONFIG_BACKLIGHT_CLASS_DEVICE=3Dy
# CONFIG_BACKLIGHT_KTD253 is not set
CONFIG_BACKLIGHT_PWM=3Dm
# CONFIG_BACKLIGHT_QCOM_WLED is not set
# CONFIG_BACKLIGHT_ADP8860 is not set
# CONFIG_BACKLIGHT_ADP8870 is not set
# CONFIG_BACKLIGHT_LM3630A is not set
# CONFIG_BACKLIGHT_LM3639 is not set
CONFIG_BACKLIGHT_LP855X=3Dm
# CONFIG_BACKLIGHT_GPIO is not set
# CONFIG_BACKLIGHT_LV5207LP is not set
# CONFIG_BACKLIGHT_BD6107 is not set
# CONFIG_BACKLIGHT_ARCXCNN is not set
# CONFIG_BACKLIGHT_LED is not set
# end of Backlight & LCD device support

CONFIG_VGASTATE=3Dm
CONFIG_HDMI=3Dy

#
# Console display driver support
#
CONFIG_VGA_CONSOLE=3Dy
CONFIG_DUMMY_CONSOLE=3Dy
CONFIG_DUMMY_CONSOLE_COLUMNS=3D80
CONFIG_DUMMY_CONSOLE_ROWS=3D25
CONFIG_FRAMEBUFFER_CONSOLE=3Dy
# CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION is not set
CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=3Dy
CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=3Dy
CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER=3Dy
# end of Console display driver support

CONFIG_LOGO=3Dy
# CONFIG_LOGO_LINUX_MONO is not set
# CONFIG_LOGO_LINUX_VGA16 is not set
CONFIG_LOGO_LINUX_CLUT224=3Dy
# end of Graphics support

CONFIG_SOUND=3Dm
CONFIG_SOUND_OSS_CORE=3Dy
CONFIG_SOUND_OSS_CORE_PRECLAIM=3Dy
CONFIG_SND=3Dm
CONFIG_SND_TIMER=3Dm
CONFIG_SND_PCM=3Dm
CONFIG_SND_HWDEP=3Dm
CONFIG_SND_SEQ_DEVICE=3Dm
CONFIG_SND_RAWMIDI=3Dm
CONFIG_SND_JACK=3Dy
CONFIG_SND_JACK_INPUT_DEV=3Dy
CONFIG_SND_OSSEMUL=3Dy
# CONFIG_SND_MIXER_OSS is not set
# CONFIG_SND_PCM_OSS is not set
CONFIG_SND_PCM_TIMER=3Dy
CONFIG_SND_HRTIMER=3Dm
CONFIG_SND_DYNAMIC_MINORS=3Dy
CONFIG_SND_MAX_CARDS=3D32
# CONFIG_SND_SUPPORT_OLD_API is not set
CONFIG_SND_PROC_FS=3Dy
CONFIG_SND_VERBOSE_PROCFS=3Dy
# CONFIG_SND_VERBOSE_PRINTK is not set
CONFIG_SND_CTL_FAST_LOOKUP=3Dy
# CONFIG_SND_DEBUG is not set
# CONFIG_SND_CTL_INPUT_VALIDATION is not set
CONFIG_SND_VMASTER=3Dy
CONFIG_SND_SEQUENCER=3Dm
CONFIG_SND_SEQ_DUMMY=3Dm
CONFIG_SND_SEQUENCER_OSS=3Dm
CONFIG_SND_SEQ_HRTIMER_DEFAULT=3Dy
CONFIG_SND_SEQ_MIDI_EVENT=3Dm
CONFIG_SND_SEQ_MIDI=3Dm
CONFIG_SND_SEQ_MIDI_EMUL=3Dm
CONFIG_SND_SEQ_VIRMIDI=3Dm
CONFIG_SND_MPU401_UART=3Dm
CONFIG_SND_OPL3_LIB=3Dm
CONFIG_SND_OPL3_LIB_SEQ=3Dm
CONFIG_SND_VX_LIB=3Dm
CONFIG_SND_AC97_CODEC=3Dm
CONFIG_SND_DRIVERS=3Dy
CONFIG_SND_DUMMY=3Dm
CONFIG_SND_ALOOP=3Dm
CONFIG_SND_VIRMIDI=3Dm
CONFIG_SND_MTPAV=3Dm
# CONFIG_SND_MTS64 is not set
# CONFIG_SND_SERIAL_U16550 is not set
CONFIG_SND_MPU401=3Dm
# CONFIG_SND_PORTMAN2X4 is not set
CONFIG_SND_AC97_POWER_SAVE=3Dy
CONFIG_SND_AC97_POWER_SAVE_DEFAULT=3D5
CONFIG_SND_PCI=3Dy
CONFIG_SND_AD1889=3Dm
# CONFIG_SND_ALS4000 is not set
CONFIG_SND_ATIIXP=3Dm
CONFIG_SND_ATIIXP_MODEM=3Dm
CONFIG_SND_AU8810=3Dm
CONFIG_SND_AU8820=3Dm
CONFIG_SND_AU8830=3Dm
# CONFIG_SND_AW2 is not set
CONFIG_SND_BT87X=3Dm
# CONFIG_SND_BT87X_OVERCLOCK is not set
CONFIG_SND_CA0106=3Dm
CONFIG_SND_CMIPCI=3Dm
CONFIG_SND_OXYGEN_LIB=3Dm
CONFIG_SND_OXYGEN=3Dm
# CONFIG_SND_CS4281 is not set
CONFIG_SND_CS46XX=3Dm
CONFIG_SND_CS46XX_NEW_DSP=3Dy
CONFIG_SND_CTXFI=3Dm
CONFIG_SND_DARLA20=3Dm
CONFIG_SND_GINA20=3Dm
CONFIG_SND_LAYLA20=3Dm
CONFIG_SND_DARLA24=3Dm
CONFIG_SND_GINA24=3Dm
CONFIG_SND_LAYLA24=3Dm
CONFIG_SND_MONA=3Dm
CONFIG_SND_MIA=3Dm
CONFIG_SND_ECHO3G=3Dm
CONFIG_SND_INDIGO=3Dm
CONFIG_SND_INDIGOIO=3Dm
CONFIG_SND_INDIGODJ=3Dm
CONFIG_SND_INDIGOIOX=3Dm
CONFIG_SND_INDIGODJX=3Dm
CONFIG_SND_ENS1370=3Dm
CONFIG_SND_ENS1371=3Dm
# CONFIG_SND_FM801 is not set
CONFIG_SND_HDSP=3Dm
CONFIG_SND_HDSPM=3Dm
CONFIG_SND_ICE1724=3Dm
CONFIG_SND_INTEL8X0=3Dm
CONFIG_SND_INTEL8X0M=3Dm
CONFIG_SND_KORG1212=3Dm
CONFIG_SND_LOLA=3Dm
CONFIG_SND_LX6464ES=3Dm
CONFIG_SND_MIXART=3Dm
# CONFIG_SND_NM256 is not set
CONFIG_SND_PCXHR=3Dm
# CONFIG_SND_RIPTIDE is not set
CONFIG_SND_RME32=3Dm
CONFIG_SND_RME96=3Dm
CONFIG_SND_RME9652=3Dm
CONFIG_SND_VIA82XX=3Dm
CONFIG_SND_VIA82XX_MODEM=3Dm
CONFIG_SND_VIRTUOSO=3Dm
CONFIG_SND_VX222=3Dm
# CONFIG_SND_YMFPCI is not set

#
# HD-Audio
#
# CONFIG_SND_HDA_INTEL is not set
# end of HD-Audio

CONFIG_SND_HDA_PREALLOC_SIZE=3D512
CONFIG_SND_PPC=3Dy
CONFIG_SND_USB=3Dy
CONFIG_SND_USB_AUDIO=3Dm
CONFIG_SND_USB_AUDIO_USE_MEDIA_CONTROLLER=3Dy
CONFIG_SND_USB_UA101=3Dm
CONFIG_SND_USB_USX2Y=3Dm
CONFIG_SND_USB_CAIAQ=3Dm
CONFIG_SND_USB_CAIAQ_INPUT=3Dy
CONFIG_SND_USB_6FIRE=3Dm
CONFIG_SND_USB_HIFACE=3Dm
CONFIG_SND_BCD2000=3Dm
CONFIG_SND_USB_LINE6=3Dm
CONFIG_SND_USB_POD=3Dm
CONFIG_SND_USB_PODHD=3Dm
CONFIG_SND_USB_TONEPORT=3Dm
CONFIG_SND_USB_VARIAX=3Dm
CONFIG_SND_FIREWIRE=3Dy
CONFIG_SND_FIREWIRE_LIB=3Dm
CONFIG_SND_DICE=3Dm
CONFIG_SND_OXFW=3Dm
CONFIG_SND_ISIGHT=3Dm
CONFIG_SND_FIREWORKS=3Dm
CONFIG_SND_BEBOB=3Dm
CONFIG_SND_FIREWIRE_DIGI00X=3Dm
CONFIG_SND_FIREWIRE_TASCAM=3Dm
CONFIG_SND_FIREWIRE_MOTU=3Dm
CONFIG_SND_FIREFACE=3Dm
# CONFIG_SND_SOC is not set
# CONFIG_SND_VIRTIO is not set
CONFIG_AC97_BUS=3Dm

#
# HID support
#
CONFIG_HID=3Dy
CONFIG_HID_BATTERY_STRENGTH=3Dy
CONFIG_HIDRAW=3Dy
CONFIG_UHID=3Dm
CONFIG_HID_GENERIC=3Dy

#
# Special HID drivers
#
CONFIG_HID_A4TECH=3Dm
# CONFIG_HID_ACCUTOUCH is not set
CONFIG_HID_ACRUX=3Dm
# CONFIG_HID_ACRUX_FF is not set
CONFIG_HID_APPLE=3Dm
CONFIG_HID_APPLEIR=3Dm
# CONFIG_HID_ASUS is not set
CONFIG_HID_AUREAL=3Dm
CONFIG_HID_BELKIN=3Dm
# CONFIG_HID_BETOP_FF is not set
# CONFIG_HID_BIGBEN_FF is not set
CONFIG_HID_CHERRY=3Dm
CONFIG_HID_CHICONY=3Dm
# CONFIG_HID_CORSAIR is not set
# CONFIG_HID_COUGAR is not set
# CONFIG_HID_MACALLY is not set
CONFIG_HID_PRODIKEYS=3Dm
# CONFIG_HID_CMEDIA is not set
# CONFIG_HID_CP2112 is not set
# CONFIG_HID_CREATIVE_SB0540 is not set
CONFIG_HID_CYPRESS=3Dm
CONFIG_HID_DRAGONRISE=3Dm
# CONFIG_DRAGONRISE_FF is not set
# CONFIG_HID_EMS_FF is not set
CONFIG_HID_ELAN=3Dm
CONFIG_HID_ELECOM=3Dm
# CONFIG_HID_ELO is not set
CONFIG_HID_EZKEY=3Dm
# CONFIG_HID_FT260 is not set
# CONFIG_HID_GEMBIRD is not set
# CONFIG_HID_GFRM is not set
# CONFIG_HID_GLORIOUS is not set
CONFIG_HID_HOLTEK=3Dm
# CONFIG_HOLTEK_FF is not set
# CONFIG_HID_VIVALDI is not set
# CONFIG_HID_GT683R is not set
CONFIG_HID_KEYTOUCH=3Dm
CONFIG_HID_KYE=3Dm
CONFIG_HID_UCLOGIC=3Dm
CONFIG_HID_WALTOP=3Dm
# CONFIG_HID_VIEWSONIC is not set
# CONFIG_HID_XIAOMI is not set
CONFIG_HID_GYRATION=3Dm
CONFIG_HID_ICADE=3Dm
CONFIG_HID_ITE=3Dm
CONFIG_HID_JABRA=3Dm
CONFIG_HID_TWINHAN=3Dm
CONFIG_HID_KENSINGTON=3Dm
CONFIG_HID_LCPOWER=3Dm
CONFIG_HID_LED=3Dm
# CONFIG_HID_LENOVO is not set
# CONFIG_HID_LETSKETCH is not set
CONFIG_HID_LOGITECH=3Dm
CONFIG_HID_LOGITECH_DJ=3Dm
CONFIG_HID_LOGITECH_HIDPP=3Dm
# CONFIG_LOGITECH_FF is not set
# CONFIG_LOGIRUMBLEPAD2_FF is not set
# CONFIG_LOGIG940_FF is not set
# CONFIG_LOGIWHEELS_FF is not set
CONFIG_HID_MAGICMOUSE=3Dy
# CONFIG_HID_MALTRON is not set
# CONFIG_HID_MAYFLASH is not set
# CONFIG_HID_MEGAWORLD_FF is not set
# CONFIG_HID_REDRAGON is not set
CONFIG_HID_MICROSOFT=3Dm
CONFIG_HID_MONTEREY=3Dm
CONFIG_HID_MULTITOUCH=3Dm
# CONFIG_HID_NINTENDO is not set
CONFIG_HID_NTI=3Dm
CONFIG_HID_NTRIG=3Dy
CONFIG_HID_ORTEK=3Dm
CONFIG_HID_PANTHERLORD=3Dm
# CONFIG_PANTHERLORD_FF is not set
# CONFIG_HID_PENMOUNT is not set
CONFIG_HID_PETALYNX=3Dm
CONFIG_HID_PICOLCD=3Dm
CONFIG_HID_PICOLCD_FB=3Dy
CONFIG_HID_PICOLCD_BACKLIGHT=3Dy
CONFIG_HID_PICOLCD_LCD=3Dy
CONFIG_HID_PICOLCD_LEDS=3Dy
CONFIG_HID_PICOLCD_CIR=3Dy
# CONFIG_HID_PLANTRONICS is not set
# CONFIG_HID_RAZER is not set
CONFIG_HID_PRIMAX=3Dm
# CONFIG_HID_RETRODE is not set
CONFIG_HID_ROCCAT=3Dm
CONFIG_HID_SAITEK=3Dm
CONFIG_HID_SAMSUNG=3Dm
# CONFIG_HID_SEMITEK is not set
# CONFIG_HID_SIGMAMICRO is not set
CONFIG_HID_SONY=3Dm
# CONFIG_SONY_FF is not set
CONFIG_HID_SPEEDLINK=3Dm
# CONFIG_HID_STEAM is not set
CONFIG_HID_STEELSERIES=3Dm
CONFIG_HID_SUNPLUS=3Dm
CONFIG_HID_RMI=3Dm
CONFIG_HID_GREENASIA=3Dm
# CONFIG_GREENASIA_FF is not set
CONFIG_HID_SMARTJOYPLUS=3Dm
# CONFIG_SMARTJOYPLUS_FF is not set
CONFIG_HID_TIVO=3Dm
CONFIG_HID_TOPSEED=3Dm
CONFIG_HID_THINGM=3Dm
CONFIG_HID_THRUSTMASTER=3Dm
# CONFIG_THRUSTMASTER_FF is not set
# CONFIG_HID_UDRAW_PS3 is not set
# CONFIG_HID_U2FZERO is not set
CONFIG_HID_WACOM=3Dm
CONFIG_HID_WIIMOTE=3Dm
# CONFIG_HID_XINMO is not set
CONFIG_HID_ZEROPLUS=3Dm
# CONFIG_ZEROPLUS_FF is not set
CONFIG_HID_ZYDACRON=3Dm
# CONFIG_HID_SENSOR_HUB is not set
# CONFIG_HID_ALPS is not set
# CONFIG_HID_MCP2221 is not set
# end of Special HID drivers

#
# USB HID support
#
CONFIG_USB_HID=3Dy
CONFIG_HID_PID=3Dy
CONFIG_USB_HIDDEV=3Dy
# end of USB HID support

#
# I2C HID support
#
# CONFIG_I2C_HID_OF is not set
# CONFIG_I2C_HID_OF_ELAN is not set
# CONFIG_I2C_HID_OF_GOODIX is not set
# end of I2C HID support
# end of HID support

CONFIG_USB_OHCI_BIG_ENDIAN_DESC=3Dy
CONFIG_USB_OHCI_BIG_ENDIAN_MMIO=3Dy
CONFIG_USB_OHCI_LITTLE_ENDIAN=3Dy
CONFIG_USB_SUPPORT=3Dy
CONFIG_USB_COMMON=3Dy
# CONFIG_USB_LED_TRIG is not set
# CONFIG_USB_ULPI_BUS is not set
# CONFIG_USB_CONN_GPIO is not set
CONFIG_USB_ARCH_HAS_HCD=3Dy
CONFIG_USB=3Dy
CONFIG_USB_PCI=3Dy
CONFIG_USB_ANNOUNCE_NEW_DEVICES=3Dy

#
# Miscellaneous USB options
#
CONFIG_USB_DEFAULT_PERSIST=3Dy
# CONFIG_USB_FEW_INIT_RETRIES is not set
# CONFIG_USB_DYNAMIC_MINORS is not set
# CONFIG_USB_OTG is not set
# CONFIG_USB_OTG_PRODUCTLIST is not set
CONFIG_USB_LEDS_TRIGGER_USBPORT=3Dm
CONFIG_USB_AUTOSUSPEND_DELAY=3D2
CONFIG_USB_MON=3Dy

#
# USB Host Controller Drivers
#
# CONFIG_USB_C67X00_HCD is not set
CONFIG_USB_XHCI_HCD=3Dy
# CONFIG_USB_XHCI_DBGCAP is not set
CONFIG_USB_XHCI_PCI=3Dy
# CONFIG_USB_XHCI_PCI_RENESAS is not set
# CONFIG_USB_XHCI_PLATFORM is not set
CONFIG_USB_EHCI_HCD=3Dy
CONFIG_USB_EHCI_ROOT_HUB_TT=3Dy
CONFIG_USB_EHCI_TT_NEWSCHED=3Dy
CONFIG_USB_EHCI_PCI=3Dy
# CONFIG_USB_EHCI_FSL is not set
CONFIG_USB_EHCI_HCD_PPC_OF=3Dy
# CONFIG_USB_EHCI_HCD_PLATFORM is not set
# CONFIG_USB_OXU210HP_HCD is not set
# CONFIG_USB_ISP116X_HCD is not set
# CONFIG_USB_FOTG210_HCD is not set
CONFIG_USB_OHCI_HCD=3Dy
CONFIG_USB_OHCI_HCD_PPC_OF_BE=3Dy
CONFIG_USB_OHCI_HCD_PPC_OF_LE=3Dy
CONFIG_USB_OHCI_HCD_PPC_OF=3Dy
CONFIG_USB_OHCI_HCD_PCI=3Dy
# CONFIG_USB_OHCI_HCD_PLATFORM is not set
CONFIG_USB_UHCI_HCD=3Dy
# CONFIG_USB_U132_HCD is not set
# CONFIG_USB_SL811_HCD is not set
# CONFIG_USB_R8A66597_HCD is not set
# CONFIG_USB_HCD_BCMA is not set
# CONFIG_USB_HCD_TEST_MODE is not set

#
# USB Device Class drivers
#
CONFIG_USB_ACM=3Dm
CONFIG_USB_PRINTER=3Dm
CONFIG_USB_WDM=3Dm
CONFIG_USB_TMC=3Dm

#
# NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
#

#
# also be needed; see USB_STORAGE Help for more info
#
CONFIG_USB_STORAGE=3Dm
# CONFIG_USB_STORAGE_DEBUG is not set
CONFIG_USB_STORAGE_REALTEK=3Dm
CONFIG_REALTEK_AUTOPM=3Dy
CONFIG_USB_STORAGE_DATAFAB=3Dm
CONFIG_USB_STORAGE_FREECOM=3Dm
# CONFIG_USB_STORAGE_ISD200 is not set
CONFIG_USB_STORAGE_USBAT=3Dm
CONFIG_USB_STORAGE_SDDR09=3Dm
CONFIG_USB_STORAGE_SDDR55=3Dm
CONFIG_USB_STORAGE_JUMPSHOT=3Dm
CONFIG_USB_STORAGE_ALAUDA=3Dm
CONFIG_USB_STORAGE_ONETOUCH=3Dm
CONFIG_USB_STORAGE_KARMA=3Dm
CONFIG_USB_STORAGE_CYPRESS_ATACB=3Dm
CONFIG_USB_STORAGE_ENE_UB6250=3Dm
CONFIG_USB_UAS=3Dm

#
# USB Imaging devices
#
CONFIG_USB_MDC800=3Dm
CONFIG_USB_MICROTEK=3Dm
# CONFIG_USBIP_CORE is not set
# CONFIG_USB_CDNS_SUPPORT is not set
# CONFIG_USB_MUSB_HDRC is not set
# CONFIG_USB_DWC3 is not set
# CONFIG_USB_DWC2 is not set
# CONFIG_USB_CHIPIDEA is not set
# CONFIG_USB_ISP1760 is not set

#
# USB port drivers
#
CONFIG_USB_USS720=3Dm
CONFIG_USB_SERIAL=3Dy
CONFIG_USB_SERIAL_CONSOLE=3Dy
CONFIG_USB_SERIAL_GENERIC=3Dy
# CONFIG_USB_SERIAL_SIMPLE is not set
CONFIG_USB_SERIAL_AIRCABLE=3Dm
CONFIG_USB_SERIAL_ARK3116=3Dm
CONFIG_USB_SERIAL_BELKIN=3Dm
CONFIG_USB_SERIAL_CH341=3Dm
CONFIG_USB_SERIAL_WHITEHEAT=3Dm
CONFIG_USB_SERIAL_DIGI_ACCELEPORT=3Dm
CONFIG_USB_SERIAL_CP210X=3Dm
CONFIG_USB_SERIAL_CYPRESS_M8=3Dm
CONFIG_USB_SERIAL_EMPEG=3Dm
CONFIG_USB_SERIAL_FTDI_SIO=3Dm
CONFIG_USB_SERIAL_VISOR=3Dm
CONFIG_USB_SERIAL_IPAQ=3Dm
CONFIG_USB_SERIAL_IR=3Dm
CONFIG_USB_SERIAL_EDGEPORT=3Dm
CONFIG_USB_SERIAL_EDGEPORT_TI=3Dm
# CONFIG_USB_SERIAL_F81232 is not set
CONFIG_USB_SERIAL_F8153X=3Dm
CONFIG_USB_SERIAL_GARMIN=3Dm
CONFIG_USB_SERIAL_IPW=3Dm
CONFIG_USB_SERIAL_IUU=3Dm
CONFIG_USB_SERIAL_KEYSPAN_PDA=3Dm
CONFIG_USB_SERIAL_KEYSPAN=3Dm
CONFIG_USB_SERIAL_KLSI=3Dm
CONFIG_USB_SERIAL_KOBIL_SCT=3Dm
CONFIG_USB_SERIAL_MCT_U232=3Dm
# CONFIG_USB_SERIAL_METRO is not set
CONFIG_USB_SERIAL_MOS7720=3Dm
CONFIG_USB_SERIAL_MOS7715_PARPORT=3Dy
CONFIG_USB_SERIAL_MOS7840=3Dm
CONFIG_USB_SERIAL_MXUPORT=3Dm
CONFIG_USB_SERIAL_NAVMAN=3Dm
CONFIG_USB_SERIAL_PL2303=3Dm
CONFIG_USB_SERIAL_OTI6858=3Dm
CONFIG_USB_SERIAL_QCAUX=3Dm
CONFIG_USB_SERIAL_QUALCOMM=3Dm
CONFIG_USB_SERIAL_SPCP8X5=3Dm
CONFIG_USB_SERIAL_SAFE=3Dm
CONFIG_USB_SERIAL_SAFE_PADDED=3Dy
CONFIG_USB_SERIAL_SIERRAWIRELESS=3Dm
CONFIG_USB_SERIAL_SYMBOL=3Dm
CONFIG_USB_SERIAL_TI=3Dm
CONFIG_USB_SERIAL_CYBERJACK=3Dm
CONFIG_USB_SERIAL_WWAN=3Dm
CONFIG_USB_SERIAL_OPTION=3Dm
CONFIG_USB_SERIAL_OMNINET=3Dm
CONFIG_USB_SERIAL_OPTICON=3Dm
CONFIG_USB_SERIAL_XSENS_MT=3Dm
# CONFIG_USB_SERIAL_WISHBONE is not set
CONFIG_USB_SERIAL_SSU100=3Dm
CONFIG_USB_SERIAL_QT2=3Dm
CONFIG_USB_SERIAL_UPD78F0730=3Dm
# CONFIG_USB_SERIAL_XR is not set
CONFIG_USB_SERIAL_DEBUG=3Dm

#
# USB Miscellaneous drivers
#
CONFIG_USB_EMI62=3Dm
CONFIG_USB_EMI26=3Dm
CONFIG_USB_ADUTUX=3Dm
CONFIG_USB_SEVSEG=3Dm
CONFIG_USB_LEGOTOWER=3Dm
CONFIG_USB_LCD=3Dm
# CONFIG_USB_CYPRESS_CY7C63 is not set
# CONFIG_USB_CYTHERM is not set
CONFIG_USB_IDMOUSE=3Dm
CONFIG_USB_FTDI_ELAN=3Dm
CONFIG_USB_APPLEDISPLAY=3Dm
# CONFIG_APPLE_MFI_FASTCHARGE is not set
CONFIG_USB_SISUSBVGA=3Dm
CONFIG_USB_LD=3Dm
# CONFIG_USB_TRANCEVIBRATOR is not set
CONFIG_USB_IOWARRIOR=3Dm
# CONFIG_USB_TEST is not set
# CONFIG_USB_EHSET_TEST_FIXTURE is not set
CONFIG_USB_ISIGHTFW=3Dm
# CONFIG_USB_YUREX is not set
CONFIG_USB_EZUSB_FX2=3Dm
# CONFIG_USB_HUB_USB251XB is not set
CONFIG_USB_HSIC_USB3503=3Dm
# CONFIG_USB_HSIC_USB4604 is not set
# CONFIG_USB_LINK_LAYER_TEST is not set
# CONFIG_USB_CHAOSKEY is not set
# CONFIG_USB_ONBOARD_HUB is not set
CONFIG_USB_ATM=3Dm
CONFIG_USB_SPEEDTOUCH=3Dm
CONFIG_USB_CXACRU=3Dm
CONFIG_USB_UEAGLEATM=3Dm
CONFIG_USB_XUSBATM=3Dm

#
# USB Physical Layer drivers
#
# CONFIG_NOP_USB_XCEIV is not set
# CONFIG_USB_GPIO_VBUS is not set
# CONFIG_USB_ISP1301 is not set
# end of USB Physical Layer drivers

# CONFIG_USB_GADGET is not set
CONFIG_TYPEC=3Dy
CONFIG_TYPEC_TCPM=3Dy
CONFIG_TYPEC_TCPCI=3Dy
CONFIG_TYPEC_RT1711H=3Dy
# CONFIG_TYPEC_TCPCI_MAXIM is not set
CONFIG_TYPEC_FUSB302=3Dm
CONFIG_TYPEC_UCSI=3Dy
# CONFIG_UCSI_CCG is not set
# CONFIG_UCSI_STM32G0 is not set
CONFIG_TYPEC_TPS6598X=3Dm
# CONFIG_TYPEC_ANX7411 is not set
# CONFIG_TYPEC_RT1719 is not set
# CONFIG_TYPEC_HD3SS3220 is not set
# CONFIG_TYPEC_STUSB160X is not set
# CONFIG_TYPEC_WUSB3801 is not set

#
# USB Type-C Multiplexer/DeMultiplexer Switch support
#
# CONFIG_TYPEC_MUX_FSA4480 is not set
CONFIG_TYPEC_MUX_PI3USB30532=3Dm
# end of USB Type-C Multiplexer/DeMultiplexer Switch support

#
# USB Type-C Alternate Mode drivers
#
CONFIG_TYPEC_DP_ALTMODE=3Dm
# CONFIG_TYPEC_NVIDIA_ALTMODE is not set
# end of USB Type-C Alternate Mode drivers

CONFIG_USB_ROLE_SWITCH=3Dy
CONFIG_MMC=3Dm
# CONFIG_PWRSEQ_EMMC is not set
# CONFIG_PWRSEQ_SD8787 is not set
# CONFIG_PWRSEQ_SIMPLE is not set
CONFIG_MMC_BLOCK=3Dm
CONFIG_MMC_BLOCK_MINORS=3D8
CONFIG_SDIO_UART=3Dm
# CONFIG_MMC_TEST is not set

#
# MMC/SD/SDIO Host Controller Drivers
#
# CONFIG_MMC_DEBUG is not set
CONFIG_MMC_SDHCI=3Dm
CONFIG_MMC_SDHCI_IO_ACCESSORS=3Dy
CONFIG_MMC_SDHCI_PCI=3Dm
CONFIG_MMC_RICOH_MMC=3Dy
CONFIG_MMC_SDHCI_PLTFM=3Dm
# CONFIG_MMC_SDHCI_OF_ASPEED is not set
# CONFIG_MMC_SDHCI_OF_ESDHC is not set
# CONFIG_MMC_SDHCI_OF_HLWD is not set
# CONFIG_MMC_SDHCI_CADENCE is not set
# CONFIG_MMC_SDHCI_F_SDH30 is not set
# CONFIG_MMC_SDHCI_MILBEAUT is not set
# CONFIG_MMC_WBSD is not set
CONFIG_MMC_TIFM_SD=3Dm
CONFIG_MMC_CB710=3Dm
CONFIG_MMC_VIA_SDMMC=3Dm
CONFIG_MMC_VUB300=3Dm
CONFIG_MMC_USHC=3Dm
# CONFIG_MMC_USDHI6ROL0 is not set
CONFIG_MMC_REALTEK_PCI=3Dm
CONFIG_MMC_REALTEK_USB=3Dm
CONFIG_MMC_CQHCI=3Dm
# CONFIG_MMC_HSQ is not set
# CONFIG_MMC_TOSHIBA_PCI is not set
# CONFIG_MMC_SDHCI_XENON is not set
# CONFIG_MMC_SDHCI_OMAP is not set
# CONFIG_SCSI_UFSHCD is not set
CONFIG_MEMSTICK=3Dm
# CONFIG_MEMSTICK_DEBUG is not set

#
# MemoryStick drivers
#
# CONFIG_MEMSTICK_UNSAFE_RESUME is not set
CONFIG_MSPRO_BLOCK=3Dm
# CONFIG_MS_BLOCK is not set

#
# MemoryStick Host Controller Drivers
#
CONFIG_MEMSTICK_TIFM_MS=3Dm
CONFIG_MEMSTICK_JMICRON_38X=3Dm
CONFIG_MEMSTICK_R592=3Dm
CONFIG_MEMSTICK_REALTEK_PCI=3Dm
# CONFIG_MEMSTICK_REALTEK_USB is not set
CONFIG_NEW_LEDS=3Dy
CONFIG_LEDS_CLASS=3Dy
# CONFIG_LEDS_CLASS_FLASH is not set
# CONFIG_LEDS_CLASS_MULTICOLOR is not set
# CONFIG_LEDS_BRIGHTNESS_HW_CHANGED is not set

#
# LED drivers
#
# CONFIG_LEDS_AN30259A is not set
# CONFIG_LEDS_AW2013 is not set
# CONFIG_LEDS_BCM6328 is not set
# CONFIG_LEDS_BCM6358 is not set
CONFIG_LEDS_LM3530=3Dm
# CONFIG_LEDS_LM3532 is not set
# CONFIG_LEDS_LM3642 is not set
# CONFIG_LEDS_LM3692X is not set
# CONFIG_LEDS_PCA9532 is not set
# CONFIG_LEDS_GPIO is not set
CONFIG_LEDS_LP3944=3Dm
# CONFIG_LEDS_LP3952 is not set
# CONFIG_LEDS_LP50XX is not set
CONFIG_LEDS_LP55XX_COMMON=3Dm
CONFIG_LEDS_LP5521=3Dm
CONFIG_LEDS_LP5523=3Dm
CONFIG_LEDS_LP5562=3Dm
# CONFIG_LEDS_LP8501 is not set
# CONFIG_LEDS_LP8860 is not set
# CONFIG_LEDS_PCA955X is not set
# CONFIG_LEDS_PCA963X is not set
# CONFIG_LEDS_PWM is not set
# CONFIG_LEDS_BD2802 is not set
CONFIG_LEDS_LT3593=3Dm
# CONFIG_LEDS_TCA6507 is not set
# CONFIG_LEDS_TLC591XX is not set
# CONFIG_LEDS_LM355x is not set
# CONFIG_LEDS_IS31FL319X is not set
# CONFIG_LEDS_IS31FL32XX is not set

#
# LED driver for blink(1) USB RGB LED is under Special HID drivers =
(HID_THINGM)
#
CONFIG_LEDS_BLINKM=3Dm
CONFIG_LEDS_POWERNV=3Dm
CONFIG_LEDS_MLXREG=3Dm
# CONFIG_LEDS_USER is not set
# CONFIG_LEDS_TI_LMU_COMMON is not set

#
# Flash and Torch LED drivers
#

#
# RGB LED drivers
#

#
# LED Triggers
#
CONFIG_LEDS_TRIGGERS=3Dy
CONFIG_LEDS_TRIGGER_TIMER=3Dm
CONFIG_LEDS_TRIGGER_ONESHOT=3Dm
CONFIG_LEDS_TRIGGER_DISK=3Dy
# CONFIG_LEDS_TRIGGER_MTD is not set
CONFIG_LEDS_TRIGGER_HEARTBEAT=3Dm
CONFIG_LEDS_TRIGGER_BACKLIGHT=3Dm
# CONFIG_LEDS_TRIGGER_CPU is not set
# CONFIG_LEDS_TRIGGER_ACTIVITY is not set
CONFIG_LEDS_TRIGGER_GPIO=3Dm
CONFIG_LEDS_TRIGGER_DEFAULT_ON=3Dm

#
# iptables trigger is under Netfilter config (LED target)
#
CONFIG_LEDS_TRIGGER_TRANSIENT=3Dm
CONFIG_LEDS_TRIGGER_CAMERA=3Dm
# CONFIG_LEDS_TRIGGER_PANIC is not set
# CONFIG_LEDS_TRIGGER_NETDEV is not set
# CONFIG_LEDS_TRIGGER_PATTERN is not set
# CONFIG_LEDS_TRIGGER_AUDIO is not set
# CONFIG_LEDS_TRIGGER_TTY is not set

#
# Simple LED drivers
#
# CONFIG_ACCESSIBILITY is not set
CONFIG_INFINIBAND=3Dm
CONFIG_INFINIBAND_USER_MAD=3Dm
CONFIG_INFINIBAND_USER_ACCESS=3Dm
CONFIG_INFINIBAND_USER_MEM=3Dy
CONFIG_INFINIBAND_ON_DEMAND_PAGING=3Dy
CONFIG_INFINIBAND_ADDR_TRANS=3Dy
CONFIG_INFINIBAND_ADDR_TRANS_CONFIGFS=3Dy
CONFIG_INFINIBAND_VIRT_DMA=3Dy
CONFIG_INFINIBAND_BNXT_RE=3Dm
CONFIG_INFINIBAND_CXGB4=3Dm
# CONFIG_INFINIBAND_EFA is not set
# CONFIG_INFINIBAND_ERDMA is not set
# CONFIG_INFINIBAND_IRDMA is not set
CONFIG_MLX4_INFINIBAND=3Dm
CONFIG_MLX5_INFINIBAND=3Dm
# CONFIG_INFINIBAND_MTHCA is not set
# CONFIG_INFINIBAND_OCRDMA is not set
CONFIG_INFINIBAND_QEDR=3Dm
CONFIG_RDMA_RXE=3Dm
CONFIG_RDMA_SIW=3Dm
CONFIG_INFINIBAND_IPOIB=3Dm
CONFIG_INFINIBAND_IPOIB_CM=3Dy
CONFIG_INFINIBAND_IPOIB_DEBUG=3Dy
# CONFIG_INFINIBAND_IPOIB_DEBUG_DATA is not set
CONFIG_INFINIBAND_SRP=3Dm
CONFIG_INFINIBAND_SRPT=3Dm
CONFIG_INFINIBAND_ISER=3Dm
CONFIG_INFINIBAND_ISERT=3Dm
# CONFIG_INFINIBAND_RTRS_CLIENT is not set
# CONFIG_INFINIBAND_RTRS_SERVER is not set
CONFIG_EDAC_ATOMIC_SCRUB=3Dy
CONFIG_EDAC_SUPPORT=3Dy
CONFIG_EDAC=3Dy
CONFIG_EDAC_LEGACY_SYSFS=3Dy
# CONFIG_EDAC_DEBUG is not set
CONFIG_EDAC_CPC925=3Dm
CONFIG_RTC_LIB=3Dy
CONFIG_RTC_MC146818_LIB=3Dy
CONFIG_RTC_CLASS=3Dy
CONFIG_RTC_HCTOSYS=3Dy
CONFIG_RTC_HCTOSYS_DEVICE=3D"rtc0"
# CONFIG_RTC_SYSTOHC is not set
# CONFIG_RTC_DEBUG is not set
CONFIG_RTC_LIB_KUNIT_TEST=3Dm
CONFIG_RTC_NVMEM=3Dy

#
# RTC interfaces
#
CONFIG_RTC_INTF_SYSFS=3Dy
CONFIG_RTC_INTF_PROC=3Dy
CONFIG_RTC_INTF_DEV=3Dy
# CONFIG_RTC_INTF_DEV_UIE_EMUL is not set
# CONFIG_RTC_DRV_TEST is not set

#
# I2C RTC drivers
#
# CONFIG_RTC_DRV_ABB5ZES3 is not set
# CONFIG_RTC_DRV_ABEOZ9 is not set
# CONFIG_RTC_DRV_ABX80X is not set
CONFIG_RTC_DRV_DS1307=3Dm
# CONFIG_RTC_DRV_DS1307_CENTURY is not set
CONFIG_RTC_DRV_DS1374=3Dm
# CONFIG_RTC_DRV_DS1374_WDT is not set
CONFIG_RTC_DRV_DS1672=3Dm
# CONFIG_RTC_DRV_HYM8563 is not set
CONFIG_RTC_DRV_MAX6900=3Dm
# CONFIG_RTC_DRV_NCT3018Y is not set
CONFIG_RTC_DRV_RS5C372=3Dm
CONFIG_RTC_DRV_ISL1208=3Dm
CONFIG_RTC_DRV_ISL12022=3Dm
# CONFIG_RTC_DRV_ISL12026 is not set
CONFIG_RTC_DRV_X1205=3Dm
CONFIG_RTC_DRV_PCF8523=3Dm
# CONFIG_RTC_DRV_PCF85063 is not set
# CONFIG_RTC_DRV_PCF85363 is not set
CONFIG_RTC_DRV_PCF8563=3Dm
CONFIG_RTC_DRV_PCF8583=3Dm
CONFIG_RTC_DRV_M41T80=3Dm
CONFIG_RTC_DRV_M41T80_WDT=3Dy
CONFIG_RTC_DRV_BQ32K=3Dm
# CONFIG_RTC_DRV_S35390A is not set
CONFIG_RTC_DRV_FM3130=3Dm
# CONFIG_RTC_DRV_RX8010 is not set
CONFIG_RTC_DRV_RX8581=3Dm
CONFIG_RTC_DRV_RX8025=3Dm
CONFIG_RTC_DRV_EM3027=3Dm
# CONFIG_RTC_DRV_RV3028 is not set
# CONFIG_RTC_DRV_RV3032 is not set
# CONFIG_RTC_DRV_RV8803 is not set
# CONFIG_RTC_DRV_SD3078 is not set

#
# SPI RTC drivers
#
CONFIG_RTC_I2C_AND_SPI=3Dy

#
# SPI and I2C RTC drivers
#
CONFIG_RTC_DRV_DS3232=3Dm
CONFIG_RTC_DRV_DS3232_HWMON=3Dy
# CONFIG_RTC_DRV_PCF2127 is not set
CONFIG_RTC_DRV_RV3029C2=3Dm
# CONFIG_RTC_DRV_RV3029_HWMON is not set
# CONFIG_RTC_DRV_RX6110 is not set

#
# Platform RTC drivers
#
CONFIG_RTC_DRV_CMOS=3Dy
CONFIG_RTC_DRV_DS1286=3Dm
CONFIG_RTC_DRV_DS1511=3Dm
CONFIG_RTC_DRV_DS1553=3Dm
# CONFIG_RTC_DRV_DS1685_FAMILY is not set
CONFIG_RTC_DRV_DS1742=3Dm
CONFIG_RTC_DRV_DS2404=3Dm
CONFIG_RTC_DRV_STK17TA8=3Dm
# CONFIG_RTC_DRV_M48T86 is not set
CONFIG_RTC_DRV_M48T35=3Dm
CONFIG_RTC_DRV_M48T59=3Dm
CONFIG_RTC_DRV_MSM6242=3Dm
CONFIG_RTC_DRV_BQ4802=3Dm
CONFIG_RTC_DRV_RP5C01=3Dm
CONFIG_RTC_DRV_V3020=3Dm
CONFIG_RTC_DRV_OPAL=3Dy
# CONFIG_RTC_DRV_ZYNQMP is not set

#
# on-CPU RTC drivers
#
CONFIG_RTC_DRV_GENERIC=3Dy
# CONFIG_RTC_DRV_CADENCE is not set
# CONFIG_RTC_DRV_FTRTC010 is not set
# CONFIG_RTC_DRV_R7301 is not set

#
# HID Sensor RTC drivers
#
# CONFIG_RTC_DRV_GOLDFISH is not set
CONFIG_DMADEVICES=3Dy
# CONFIG_DMADEVICES_DEBUG is not set

#
# DMA Devices
#
CONFIG_DMA_ENGINE=3Dy
CONFIG_DMA_OF=3Dy
# CONFIG_ALTERA_MSGDMA is not set
# CONFIG_DW_AXI_DMAC is not set
# CONFIG_FSL_EDMA is not set
# CONFIG_INTEL_IDMA64 is not set
# CONFIG_PLX_DMA is not set
# CONFIG_XILINX_ZYNQMP_DPDMA is not set
# CONFIG_QCOM_HIDMA_MGMT is not set
# CONFIG_QCOM_HIDMA is not set
CONFIG_DW_DMAC_CORE=3Dm
CONFIG_DW_DMAC=3Dm
# CONFIG_DW_DMAC_PCI is not set
# CONFIG_DW_EDMA is not set
# CONFIG_DW_EDMA_PCIE is not set
# CONFIG_SF_PDMA is not set

#
# DMA Clients
#
CONFIG_ASYNC_TX_DMA=3Dy
CONFIG_DMATEST=3Dm
CONFIG_DMA_ENGINE_RAID=3Dy

#
# DMABUF options
#
CONFIG_SYNC_FILE=3Dy
# CONFIG_SW_SYNC is not set
# CONFIG_UDMABUF is not set
# CONFIG_DMABUF_MOVE_NOTIFY is not set
# CONFIG_DMABUF_DEBUG is not set
# CONFIG_DMABUF_SELFTESTS is not set
# CONFIG_DMABUF_HEAPS is not set
# CONFIG_DMABUF_SYSFS_STATS is not set
# end of DMABUF options

# CONFIG_AUXDISPLAY is not set
# CONFIG_PANEL is not set
CONFIG_UIO=3Dm
CONFIG_UIO_CIF=3Dm
CONFIG_UIO_PDRV_GENIRQ=3Dm
# CONFIG_UIO_DMEM_GENIRQ is not set
CONFIG_UIO_AEC=3Dm
CONFIG_UIO_SERCOS3=3Dm
CONFIG_UIO_PCI_GENERIC=3Dm
# CONFIG_UIO_NETX is not set
# CONFIG_UIO_PRUSS is not set
# CONFIG_UIO_MF624 is not set
CONFIG_VFIO=3Dm
CONFIG_VFIO_IOMMU_SPAPR_TCE=3Dm
CONFIG_VFIO_SPAPR_EEH=3Dm
CONFIG_VFIO_VIRQFD=3Dm
# CONFIG_VFIO_NOIOMMU is not set
CONFIG_VFIO_PCI_CORE=3Dm
CONFIG_VFIO_PCI_MMAP=3Dy
CONFIG_VFIO_PCI_INTX=3Dy
CONFIG_VFIO_PCI=3Dm
# CONFIG_MLX5_VFIO_PCI is not set
# CONFIG_VFIO_MDEV is not set
CONFIG_IRQ_BYPASS_MANAGER=3Dy
CONFIG_VIRT_DRIVERS=3Dy
CONFIG_VIRTIO_ANCHOR=3Dy
CONFIG_VIRTIO=3Dy
CONFIG_VIRTIO_PCI_LIB=3Dy
CONFIG_VIRTIO_PCI_LIB_LEGACY=3Dy
CONFIG_VIRTIO_MENU=3Dy
CONFIG_VIRTIO_PCI=3Dy
CONFIG_VIRTIO_PCI_LEGACY=3Dy
CONFIG_VIRTIO_VDPA=3Dm
# CONFIG_VIRTIO_PMEM is not set
CONFIG_VIRTIO_BALLOON=3Dm
CONFIG_VIRTIO_INPUT=3Dm
# CONFIG_VIRTIO_MMIO is not set
CONFIG_VIRTIO_DMA_SHARED_BUFFER=3Dm
CONFIG_VDPA=3Dm
CONFIG_VDPA_SIM=3Dm
# CONFIG_VDPA_SIM_NET is not set
# CONFIG_VDPA_SIM_BLOCK is not set
# CONFIG_VDPA_USER is not set
CONFIG_IFCVF=3Dm
# CONFIG_MLX5_VDPA_NET is not set
# CONFIG_VP_VDPA is not set
CONFIG_VHOST_IOTLB=3Dm
CONFIG_VHOST_RING=3Dm
CONFIG_VHOST=3Dm
CONFIG_VHOST_MENU=3Dy
CONFIG_VHOST_NET=3Dm
# CONFIG_VHOST_SCSI is not set
CONFIG_VHOST_VSOCK=3Dm
CONFIG_VHOST_VDPA=3Dm
CONFIG_VHOST_CROSS_ENDIAN_LEGACY=3Dy

#
# Microsoft Hyper-V guest support
#
# end of Microsoft Hyper-V guest support

# CONFIG_GREYBUS is not set
# CONFIG_COMEDI is not set
# CONFIG_STAGING is not set
# CONFIG_GOLDFISH is not set
# CONFIG_COMMON_CLK is not set
CONFIG_HWSPINLOCK=3Dy

#
# Clock Source drivers
#
CONFIG_I8253_LOCK=3Dy
CONFIG_CLKBLD_I8253=3Dy
# CONFIG_MICROCHIP_PIT64B is not set
# end of Clock Source drivers

# CONFIG_MAILBOX is not set
CONFIG_IOMMU_IOVA=3Dm
CONFIG_IOMMU_API=3Dy
CONFIG_IOMMU_SUPPORT=3Dy

#
# Generic IOMMU Pagetable Support
#
# end of Generic IOMMU Pagetable Support

# CONFIG_IOMMU_DEBUGFS is not set
CONFIG_IOMMU_DEFAULT_DMA_STRICT=3Dy
# CONFIG_IOMMU_DEFAULT_DMA_LAZY is not set
# CONFIG_IOMMU_DEFAULT_PASSTHROUGH is not set
CONFIG_OF_IOMMU=3Dy
CONFIG_SPAPR_TCE_IOMMU=3Dy

#
# Remoteproc drivers
#
# CONFIG_REMOTEPROC is not set
# end of Remoteproc drivers

#
# Rpmsg drivers
#
# CONFIG_RPMSG_VIRTIO is not set
# end of Rpmsg drivers

# CONFIG_SOUNDWIRE is not set

#
# SOC (System On Chip) specific Drivers
#

#
# Amlogic SoC drivers
#
# end of Amlogic SoC drivers

#
# Broadcom SoC drivers
#
# end of Broadcom SoC drivers

#
# NXP/Freescale QorIQ SoC drivers
#
# CONFIG_QUICC_ENGINE is not set
# end of NXP/Freescale QorIQ SoC drivers

#
# fujitsu SoC drivers
#
# end of fujitsu SoC drivers

#
# i.MX SoC drivers
#
# end of i.MX SoC drivers

#
# Enable LiteX SoC Builder specific drivers
#
# CONFIG_LITEX_SOC_CONTROLLER is not set
# end of Enable LiteX SoC Builder specific drivers

#
# Qualcomm SoC drivers
#
# end of Qualcomm SoC drivers

# CONFIG_SOC_TI is not set

#
# Xilinx SoC drivers
#
# end of Xilinx SoC drivers
# end of SOC (System On Chip) specific Drivers

# CONFIG_PM_DEVFREQ is not set
# CONFIG_EXTCON is not set
# CONFIG_MEMORY is not set
# CONFIG_IIO is not set
# CONFIG_NTB is not set
CONFIG_PWM=3Dy
CONFIG_PWM_SYSFS=3Dy
# CONFIG_PWM_DEBUG is not set
# CONFIG_PWM_ATMEL_TCB is not set
# CONFIG_PWM_DWC is not set
# CONFIG_PWM_FSL_FTM is not set
# CONFIG_PWM_PCA9685 is not set

#
# IRQ chip support
#
CONFIG_IRQCHIP=3Dy
# CONFIG_AL_FIC is not set
# CONFIG_XILINX_INTC is not set
# end of IRQ chip support

# CONFIG_IPACK_BUS is not set
# CONFIG_RESET_CONTROLLER is not set

#
# PHY Subsystem
#
# CONFIG_GENERIC_PHY is not set
# CONFIG_PHY_CAN_TRANSCEIVER is not set

#
# PHY drivers for Broadcom platforms
#
# CONFIG_BCM_KONA_USB2_PHY is not set
# end of PHY drivers for Broadcom platforms

# CONFIG_PHY_CADENCE_DPHY is not set
# CONFIG_PHY_CADENCE_DPHY_RX is not set
# CONFIG_PHY_CADENCE_SALVO is not set
# CONFIG_PHY_PXA_28NM_HSIC is not set
# CONFIG_PHY_PXA_28NM_USB2 is not set
# CONFIG_PHY_MAPPHONE_MDM6600 is not set
# end of PHY Subsystem

# CONFIG_POWERCAP is not set
# CONFIG_MCB is not set

#
# Performance monitor support
#
# end of Performance monitor support

CONFIG_RAS=3Dy
CONFIG_USB4=3Dy
# CONFIG_USB4_DEBUGFS_WRITE is not set
# CONFIG_USB4_DMA_TEST is not set

#
# Android
#
# CONFIG_ANDROID_BINDER_IPC is not set
# end of Android

CONFIG_LIBNVDIMM=3Dm
CONFIG_BLK_DEV_PMEM=3Dm
CONFIG_ND_CLAIM=3Dy
CONFIG_ND_BTT=3Dm
CONFIG_BTT=3Dy
CONFIG_ND_PFN=3Dm
CONFIG_NVDIMM_PFN=3Dy
CONFIG_NVDIMM_DAX=3Dy
CONFIG_OF_PMEM=3Dm
CONFIG_NVDIMM_KEYS=3Dy
CONFIG_DAX=3Dy
CONFIG_DEV_DAX=3Dm
CONFIG_DEV_DAX_PMEM=3Dm
CONFIG_DEV_DAX_KMEM=3Dm
CONFIG_NVMEM=3Dy
CONFIG_NVMEM_SYSFS=3Dy
# CONFIG_NVMEM_RMEM is not set

#
# HW tracing support
#
# CONFIG_STM is not set
# CONFIG_INTEL_TH is not set
# end of HW tracing support

# CONFIG_FPGA is not set
# CONFIG_FSI is not set
# CONFIG_SIOX is not set
# CONFIG_SLIMBUS is not set
# CONFIG_INTERCONNECT is not set
# CONFIG_COUNTER is not set
# CONFIG_MOST is not set
# CONFIG_PECI is not set
# CONFIG_HTE is not set
# end of Device Drivers

#
# File systems
#
CONFIG_DCACHE_WORD_ACCESS=3Dy
# CONFIG_VALIDATE_FS_PARSER is not set
CONFIG_FS_IOMAP=3Dy
# CONFIG_EXT2_FS is not set
# CONFIG_EXT3_FS is not set
CONFIG_EXT4_FS=3Dm
CONFIG_EXT4_USE_FOR_EXT2=3Dy
CONFIG_EXT4_FS_POSIX_ACL=3Dy
CONFIG_EXT4_FS_SECURITY=3Dy
# CONFIG_EXT4_DEBUG is not set
CONFIG_EXT4_KUNIT_TESTS=3Dm
CONFIG_JBD2=3Dm
# CONFIG_JBD2_DEBUG is not set
CONFIG_FS_MBCACHE=3Dm
# CONFIG_REISERFS_FS is not set
# CONFIG_JFS_FS is not set
CONFIG_XFS_FS=3Dm
CONFIG_XFS_SUPPORT_V4=3Dy
CONFIG_XFS_QUOTA=3Dy
CONFIG_XFS_POSIX_ACL=3Dy
# CONFIG_XFS_RT is not set
# CONFIG_XFS_ONLINE_SCRUB is not set
# CONFIG_XFS_WARN is not set
# CONFIG_XFS_DEBUG is not set
CONFIG_GFS2_FS=3Dm
CONFIG_GFS2_FS_LOCKING_DLM=3Dy
# CONFIG_OCFS2_FS is not set
# CONFIG_BTRFS_FS is not set
# CONFIG_NILFS2_FS is not set
# CONFIG_F2FS_FS is not set
CONFIG_FS_DAX=3Dy
CONFIG_FS_DAX_PMD=3Dy
CONFIG_FS_POSIX_ACL=3Dy
CONFIG_EXPORTFS=3Dy
CONFIG_EXPORTFS_BLOCK_OPS=3Dy
CONFIG_FILE_LOCKING=3Dy
# CONFIG_FS_ENCRYPTION is not set
# CONFIG_FS_VERITY is not set
CONFIG_FSNOTIFY=3Dy
CONFIG_DNOTIFY=3Dy
CONFIG_INOTIFY_USER=3Dy
CONFIG_FANOTIFY=3Dy
CONFIG_FANOTIFY_ACCESS_PERMISSIONS=3Dy
CONFIG_QUOTA=3Dy
CONFIG_QUOTA_NETLINK_INTERFACE=3Dy
CONFIG_PRINT_QUOTA_WARNING=3Dy
# CONFIG_QUOTA_DEBUG is not set
CONFIG_QUOTA_TREE=3Dy
# CONFIG_QFMT_V1 is not set
CONFIG_QFMT_V2=3Dy
CONFIG_QUOTACTL=3Dy
CONFIG_AUTOFS4_FS=3Dy
CONFIG_AUTOFS_FS=3Dy
CONFIG_FUSE_FS=3Dm
CONFIG_CUSE=3Dm
CONFIG_VIRTIO_FS=3Dm
# CONFIG_FUSE_DAX is not set
CONFIG_OVERLAY_FS=3Dm
# CONFIG_OVERLAY_FS_REDIRECT_DIR is not set
# CONFIG_OVERLAY_FS_REDIRECT_ALWAYS_FOLLOW is not set
# CONFIG_OVERLAY_FS_INDEX is not set
# CONFIG_OVERLAY_FS_XINO_AUTO is not set
# CONFIG_OVERLAY_FS_METACOPY is not set

#
# Caches
#
CONFIG_NETFS_SUPPORT=3Dm
CONFIG_NETFS_STATS=3Dy
CONFIG_FSCACHE=3Dm
CONFIG_FSCACHE_STATS=3Dy
# CONFIG_FSCACHE_DEBUG is not set
CONFIG_CACHEFILES=3Dm
# CONFIG_CACHEFILES_DEBUG is not set
# CONFIG_CACHEFILES_ERROR_INJECTION is not set
# CONFIG_CACHEFILES_ONDEMAND is not set
# end of Caches

#
# CD-ROM/DVD Filesystems
#
CONFIG_ISO9660_FS=3Dm
CONFIG_JOLIET=3Dy
CONFIG_ZISOFS=3Dy
CONFIG_UDF_FS=3Dm
# end of CD-ROM/DVD Filesystems

#
# DOS/FAT/EXFAT/NT Filesystems
#
CONFIG_FAT_FS=3Dm
CONFIG_MSDOS_FS=3Dm
CONFIG_VFAT_FS=3Dm
CONFIG_FAT_DEFAULT_CODEPAGE=3D437
CONFIG_FAT_DEFAULT_IOCHARSET=3D"ascii"
# CONFIG_FAT_DEFAULT_UTF8 is not set
CONFIG_FAT_KUNIT_TEST=3Dm
# CONFIG_EXFAT_FS is not set
# CONFIG_NTFS_FS is not set
# CONFIG_NTFS3_FS is not set
# end of DOS/FAT/EXFAT/NT Filesystems

#
# Pseudo filesystems
#
CONFIG_PROC_FS=3Dy
CONFIG_PROC_KCORE=3Dy
CONFIG_PROC_VMCORE=3Dy
CONFIG_PROC_VMCORE_DEVICE_DUMP=3Dy
CONFIG_PROC_SYSCTL=3Dy
CONFIG_PROC_PAGE_MONITOR=3Dy
CONFIG_PROC_CHILDREN=3Dy
CONFIG_KERNFS=3Dy
CONFIG_SYSFS=3Dy
CONFIG_TMPFS=3Dy
CONFIG_TMPFS_POSIX_ACL=3Dy
CONFIG_TMPFS_XATTR=3Dy
# CONFIG_TMPFS_INODE64 is not set
CONFIG_ARCH_SUPPORTS_HUGETLBFS=3Dy
CONFIG_HUGETLBFS=3Dy
CONFIG_HUGETLB_PAGE=3Dy
CONFIG_MEMFD_CREATE=3Dy
CONFIG_ARCH_HAS_GIGANTIC_PAGE=3Dy
CONFIG_CONFIGFS_FS=3Dy
# end of Pseudo filesystems

CONFIG_MISC_FILESYSTEMS=3Dy
# CONFIG_ORANGEFS_FS is not set
# CONFIG_ADFS_FS is not set
# CONFIG_AFFS_FS is not set
# CONFIG_ECRYPT_FS is not set
# CONFIG_HFS_FS is not set
# CONFIG_HFSPLUS_FS is not set
# CONFIG_BEFS_FS is not set
# CONFIG_BFS_FS is not set
# CONFIG_EFS_FS is not set
# CONFIG_JFFS2_FS is not set
# CONFIG_UBIFS_FS is not set
CONFIG_CRAMFS=3Dm
CONFIG_CRAMFS_BLOCKDEV=3Dy
# CONFIG_CRAMFS_MTD is not set
CONFIG_SQUASHFS=3Dm
# CONFIG_SQUASHFS_FILE_CACHE is not set
CONFIG_SQUASHFS_FILE_DIRECT=3Dy
# CONFIG_SQUASHFS_DECOMP_SINGLE is not set
# CONFIG_SQUASHFS_DECOMP_MULTI is not set
CONFIG_SQUASHFS_DECOMP_MULTI_PERCPU=3Dy
CONFIG_SQUASHFS_XATTR=3Dy
CONFIG_SQUASHFS_ZLIB=3Dy
# CONFIG_SQUASHFS_LZ4 is not set
CONFIG_SQUASHFS_LZO=3Dy
CONFIG_SQUASHFS_XZ=3Dy
# CONFIG_SQUASHFS_ZSTD is not set
# CONFIG_SQUASHFS_4K_DEVBLK_SIZE is not set
# CONFIG_SQUASHFS_EMBEDDED is not set
CONFIG_SQUASHFS_FRAGMENT_CACHE_SIZE=3D3
# CONFIG_VXFS_FS is not set
# CONFIG_MINIX_FS is not set
# CONFIG_OMFS_FS is not set
# CONFIG_HPFS_FS is not set
# CONFIG_QNX4FS_FS is not set
# CONFIG_QNX6FS_FS is not set
# CONFIG_ROMFS_FS is not set
CONFIG_PSTORE=3Dy
CONFIG_PSTORE_DEFAULT_KMSG_BYTES=3D10240
CONFIG_PSTORE_DEFLATE_COMPRESS=3Dy
# CONFIG_PSTORE_LZO_COMPRESS is not set
# CONFIG_PSTORE_LZ4_COMPRESS is not set
# CONFIG_PSTORE_LZ4HC_COMPRESS is not set
# CONFIG_PSTORE_842_COMPRESS is not set
# CONFIG_PSTORE_ZSTD_COMPRESS is not set
CONFIG_PSTORE_COMPRESS=3Dy
CONFIG_PSTORE_DEFLATE_COMPRESS_DEFAULT=3Dy
CONFIG_PSTORE_COMPRESS_DEFAULT=3D"deflate"
# CONFIG_PSTORE_CONSOLE is not set
# CONFIG_PSTORE_PMSG is not set
# CONFIG_PSTORE_FTRACE is not set
CONFIG_PSTORE_RAM=3Dm
# CONFIG_PSTORE_BLK is not set
# CONFIG_SYSV_FS is not set
# CONFIG_UFS_FS is not set
# CONFIG_EROFS_FS is not set
CONFIG_NETWORK_FILESYSTEMS=3Dy
CONFIG_NFS_FS=3Dm
# CONFIG_NFS_V2 is not set
CONFIG_NFS_V3=3Dm
CONFIG_NFS_V3_ACL=3Dy
CONFIG_NFS_V4=3Dm
# CONFIG_NFS_SWAP is not set
CONFIG_NFS_V4_1=3Dy
CONFIG_NFS_V4_2=3Dy
CONFIG_PNFS_FILE_LAYOUT=3Dm
CONFIG_PNFS_BLOCK=3Dm
CONFIG_PNFS_FLEXFILE_LAYOUT=3Dm
CONFIG_NFS_V4_1_IMPLEMENTATION_ID_DOMAIN=3D"kernel.org"
# CONFIG_NFS_V4_1_MIGRATION is not set
CONFIG_NFS_V4_SECURITY_LABEL=3Dy
CONFIG_NFS_FSCACHE=3Dy
# CONFIG_NFS_USE_LEGACY_DNS is not set
CONFIG_NFS_USE_KERNEL_DNS=3Dy
CONFIG_NFS_DEBUG=3Dy
CONFIG_NFS_DISABLE_UDP_SUPPORT=3Dy
# CONFIG_NFS_V4_2_READ_PLUS is not set
CONFIG_NFSD=3Dm
CONFIG_NFSD_V2_ACL=3Dy
CONFIG_NFSD_V3_ACL=3Dy
CONFIG_NFSD_V4=3Dy
CONFIG_NFSD_PNFS=3Dy
# CONFIG_NFSD_BLOCKLAYOUT is not set
CONFIG_NFSD_SCSILAYOUT=3Dy
# CONFIG_NFSD_FLEXFILELAYOUT is not set
# CONFIG_NFSD_V4_2_INTER_SSC is not set
CONFIG_NFSD_V4_SECURITY_LABEL=3Dy
CONFIG_GRACE_PERIOD=3Dm
CONFIG_LOCKD=3Dm
CONFIG_LOCKD_V4=3Dy
CONFIG_NFS_ACL_SUPPORT=3Dm
CONFIG_NFS_COMMON=3Dy
CONFIG_NFS_V4_2_SSC_HELPER=3Dy
CONFIG_SUNRPC=3Dm
CONFIG_SUNRPC_GSS=3Dm
CONFIG_SUNRPC_BACKCHANNEL=3Dy
CONFIG_RPCSEC_GSS_KRB5=3Dm
# CONFIG_SUNRPC_DISABLE_INSECURE_ENCTYPES is not set
CONFIG_SUNRPC_DEBUG=3Dy
CONFIG_SUNRPC_XPRT_RDMA=3Dm
CONFIG_CEPH_FS=3Dm
# CONFIG_CEPH_FSCACHE is not set
CONFIG_CEPH_FS_POSIX_ACL=3Dy
CONFIG_CEPH_FS_SECURITY_LABEL=3Dy
CONFIG_CIFS=3Dm
# CONFIG_CIFS_STATS2 is not set
CONFIG_CIFS_ALLOW_INSECURE_LEGACY=3Dy
CONFIG_CIFS_UPCALL=3Dy
CONFIG_CIFS_XATTR=3Dy
CONFIG_CIFS_POSIX=3Dy
CONFIG_CIFS_DEBUG=3Dy
# CONFIG_CIFS_DEBUG2 is not set
# CONFIG_CIFS_DEBUG_DUMP_KEYS is not set
CONFIG_CIFS_DFS_UPCALL=3Dy
# CONFIG_CIFS_SWN_UPCALL is not set
CONFIG_CIFS_SMB_DIRECT=3Dy
# CONFIG_CIFS_FSCACHE is not set
# CONFIG_SMB_SERVER is not set
CONFIG_SMBFS_COMMON=3Dm
# CONFIG_CODA_FS is not set
# CONFIG_AFS_FS is not set
CONFIG_NLS=3Dy
CONFIG_NLS_DEFAULT=3D"utf8"
CONFIG_NLS_CODEPAGE_437=3Dy
CONFIG_NLS_CODEPAGE_737=3Dm
CONFIG_NLS_CODEPAGE_775=3Dm
CONFIG_NLS_CODEPAGE_850=3Dm
CONFIG_NLS_CODEPAGE_852=3Dm
CONFIG_NLS_CODEPAGE_855=3Dm
CONFIG_NLS_CODEPAGE_857=3Dm
CONFIG_NLS_CODEPAGE_860=3Dm
CONFIG_NLS_CODEPAGE_861=3Dm
CONFIG_NLS_CODEPAGE_862=3Dm
CONFIG_NLS_CODEPAGE_863=3Dm
CONFIG_NLS_CODEPAGE_864=3Dm
CONFIG_NLS_CODEPAGE_865=3Dm
CONFIG_NLS_CODEPAGE_866=3Dm
CONFIG_NLS_CODEPAGE_869=3Dm
CONFIG_NLS_CODEPAGE_936=3Dm
CONFIG_NLS_CODEPAGE_950=3Dm
CONFIG_NLS_CODEPAGE_932=3Dm
CONFIG_NLS_CODEPAGE_949=3Dm
CONFIG_NLS_CODEPAGE_874=3Dm
CONFIG_NLS_ISO8859_8=3Dm
CONFIG_NLS_CODEPAGE_1250=3Dm
CONFIG_NLS_CODEPAGE_1251=3Dm
CONFIG_NLS_ASCII=3Dy
CONFIG_NLS_ISO8859_1=3Dm
CONFIG_NLS_ISO8859_2=3Dm
CONFIG_NLS_ISO8859_3=3Dm
CONFIG_NLS_ISO8859_4=3Dm
CONFIG_NLS_ISO8859_5=3Dm
CONFIG_NLS_ISO8859_6=3Dm
CONFIG_NLS_ISO8859_7=3Dm
CONFIG_NLS_ISO8859_9=3Dm
CONFIG_NLS_ISO8859_13=3Dm
CONFIG_NLS_ISO8859_14=3Dm
CONFIG_NLS_ISO8859_15=3Dm
CONFIG_NLS_KOI8_R=3Dm
CONFIG_NLS_KOI8_U=3Dm
CONFIG_NLS_MAC_ROMAN=3Dm
CONFIG_NLS_MAC_CELTIC=3Dm
CONFIG_NLS_MAC_CENTEURO=3Dm
CONFIG_NLS_MAC_CROATIAN=3Dm
CONFIG_NLS_MAC_CYRILLIC=3Dm
CONFIG_NLS_MAC_GAELIC=3Dm
CONFIG_NLS_MAC_GREEK=3Dm
CONFIG_NLS_MAC_ICELAND=3Dm
CONFIG_NLS_MAC_INUIT=3Dm
CONFIG_NLS_MAC_ROMANIAN=3Dm
CONFIG_NLS_MAC_TURKISH=3Dm
CONFIG_NLS_UTF8=3Dm
CONFIG_DLM=3Dm
# CONFIG_DLM_DEPRECATED_API is not set
CONFIG_DLM_DEBUG=3Dy
# CONFIG_UNICODE is not set
CONFIG_IO_WQ=3Dy
# end of File systems

#
# Security options
#
CONFIG_KEYS=3Dy
# CONFIG_KEYS_REQUEST_CACHE is not set
CONFIG_PERSISTENT_KEYRINGS=3Dy
CONFIG_TRUSTED_KEYS=3Dy
CONFIG_TRUSTED_KEYS_TPM=3Dy
CONFIG_ENCRYPTED_KEYS=3Dy
# CONFIG_USER_DECRYPTED_DATA is not set
# CONFIG_KEY_DH_OPERATIONS is not set
# CONFIG_SECURITY_DMESG_RESTRICT is not set
CONFIG_SECURITY=3Dy
CONFIG_SECURITY_WRITABLE_HOOKS=3Dy
CONFIG_SECURITYFS=3Dy
CONFIG_SECURITY_NETWORK=3Dy
CONFIG_SECURITY_INFINIBAND=3Dy
CONFIG_SECURITY_NETWORK_XFRM=3Dy
# CONFIG_SECURITY_PATH is not set
CONFIG_LSM_MMAP_MIN_ADDR=3D65535
CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=3Dy
CONFIG_HARDENED_USERCOPY=3Dy
CONFIG_FORTIFY_SOURCE=3Dy
# CONFIG_STATIC_USERMODEHELPER is not set
CONFIG_SECURITY_SELINUX=3Dy
CONFIG_SECURITY_SELINUX_BOOTPARAM=3Dy
CONFIG_SECURITY_SELINUX_DISABLE=3Dy
CONFIG_SECURITY_SELINUX_DEVELOP=3Dy
CONFIG_SECURITY_SELINUX_AVC_STATS=3Dy
CONFIG_SECURITY_SELINUX_CHECKREQPROT_VALUE=3D1
CONFIG_SECURITY_SELINUX_SIDTAB_HASH_BITS=3D9
CONFIG_SECURITY_SELINUX_SID2STR_CACHE_SIZE=3D256
# CONFIG_SECURITY_SMACK is not set
# CONFIG_SECURITY_TOMOYO is not set
# CONFIG_SECURITY_APPARMOR is not set
# CONFIG_SECURITY_LOADPIN is not set
CONFIG_SECURITY_YAMA=3Dy
# CONFIG_SECURITY_SAFESETID is not set
# CONFIG_SECURITY_LOCKDOWN_LSM is not set
# CONFIG_SECURITY_LANDLOCK is not set
CONFIG_INTEGRITY=3Dy
CONFIG_INTEGRITY_SIGNATURE=3Dy
CONFIG_INTEGRITY_ASYMMETRIC_KEYS=3Dy
CONFIG_INTEGRITY_TRUSTED_KEYRING=3Dy
CONFIG_INTEGRITY_PLATFORM_KEYRING=3Dy
CONFIG_LOAD_PPC_KEYS=3Dy
CONFIG_INTEGRITY_AUDIT=3Dy
CONFIG_IMA=3Dy
CONFIG_IMA_KEXEC=3Dy
CONFIG_IMA_MEASURE_PCR_IDX=3D10
CONFIG_IMA_LSM_RULES=3Dy
# CONFIG_IMA_NG_TEMPLATE is not set
CONFIG_IMA_SIG_TEMPLATE=3Dy
CONFIG_IMA_DEFAULT_TEMPLATE=3D"ima-sig"
# CONFIG_IMA_DEFAULT_HASH_SHA1 is not set
CONFIG_IMA_DEFAULT_HASH_SHA256=3Dy
# CONFIG_IMA_DEFAULT_HASH_SHA512 is not set
CONFIG_IMA_DEFAULT_HASH=3D"sha256"
# CONFIG_IMA_WRITE_POLICY is not set
CONFIG_IMA_READ_POLICY=3Dy
CONFIG_IMA_APPRAISE=3Dy
CONFIG_IMA_ARCH_POLICY=3Dy
# CONFIG_IMA_APPRAISE_BUILD_POLICY is not set
CONFIG_IMA_APPRAISE_BOOTPARAM=3Dy
CONFIG_IMA_APPRAISE_MODSIG=3Dy
CONFIG_IMA_TRUSTED_KEYRING=3Dy
# CONFIG_IMA_BLACKLIST_KEYRING is not set
# CONFIG_IMA_LOAD_X509 is not set
CONFIG_IMA_MEASURE_ASYMMETRIC_KEYS=3Dy
CONFIG_IMA_QUEUE_EARLY_BOOT_KEYS=3Dy
CONFIG_IMA_SECURE_AND_OR_TRUSTED_BOOT=3Dy
# CONFIG_IMA_DISABLE_HTABLE is not set
CONFIG_EVM=3Dy
CONFIG_EVM_ATTR_FSUUID=3Dy
# CONFIG_EVM_ADD_XATTRS is not set
# CONFIG_EVM_LOAD_X509 is not set
CONFIG_DEFAULT_SECURITY_SELINUX=3Dy
# CONFIG_DEFAULT_SECURITY_DAC is not set
=
CONFIG_LSM=3D"landlock,lockdown,yama,loadpin,safesetid,integrity,selinux,s=
mack,tomoyo,apparmor,bpf"

#
# Kernel hardening options
#

#
# Memory initialization
#
CONFIG_INIT_STACK_NONE=3Dy
# CONFIG_GCC_PLUGIN_STRUCTLEAK_USER is not set
# CONFIG_GCC_PLUGIN_STRUCTLEAK_BYREF is not set
# CONFIG_GCC_PLUGIN_STRUCTLEAK_BYREF_ALL is not set
# CONFIG_INIT_ON_ALLOC_DEFAULT_ON is not set
# CONFIG_INIT_ON_FREE_DEFAULT_ON is not set
CONFIG_CC_HAS_ZERO_CALL_USED_REGS=3Dy
# CONFIG_ZERO_CALL_USED_REGS is not set
# end of Memory initialization

CONFIG_RANDSTRUCT_NONE=3Dy
# CONFIG_RANDSTRUCT_FULL is not set
# CONFIG_RANDSTRUCT_PERFORMANCE is not set
# end of Kernel hardening options
# end of Security options

CONFIG_XOR_BLOCKS=3Dm
CONFIG_ASYNC_CORE=3Dm
CONFIG_ASYNC_MEMCPY=3Dm
CONFIG_ASYNC_XOR=3Dm
CONFIG_ASYNC_PQ=3Dm
CONFIG_ASYNC_RAID6_RECOV=3Dm
CONFIG_CRYPTO=3Dy

#
# Crypto core or helper
#
CONFIG_CRYPTO_ALGAPI=3Dy
CONFIG_CRYPTO_ALGAPI2=3Dy
CONFIG_CRYPTO_AEAD=3Dy
CONFIG_CRYPTO_AEAD2=3Dy
CONFIG_CRYPTO_SKCIPHER=3Dy
CONFIG_CRYPTO_SKCIPHER2=3Dy
CONFIG_CRYPTO_HASH=3Dy
CONFIG_CRYPTO_HASH2=3Dy
CONFIG_CRYPTO_RNG=3Dy
CONFIG_CRYPTO_RNG2=3Dy
CONFIG_CRYPTO_RNG_DEFAULT=3Dm
CONFIG_CRYPTO_AKCIPHER2=3Dy
CONFIG_CRYPTO_AKCIPHER=3Dy
CONFIG_CRYPTO_KPP2=3Dy
CONFIG_CRYPTO_KPP=3Dm
CONFIG_CRYPTO_ACOMP2=3Dy
CONFIG_CRYPTO_MANAGER=3Dy
CONFIG_CRYPTO_MANAGER2=3Dy
CONFIG_CRYPTO_USER=3Dm
# CONFIG_CRYPTO_MANAGER_DISABLE_TESTS is not set
# CONFIG_CRYPTO_MANAGER_EXTRA_TESTS is not set
CONFIG_CRYPTO_GF128MUL=3Dy
CONFIG_CRYPTO_NULL=3Dy
CONFIG_CRYPTO_NULL2=3Dy
CONFIG_CRYPTO_PCRYPT=3Dm
CONFIG_CRYPTO_CRYPTD=3Dy
CONFIG_CRYPTO_AUTHENC=3Dy
CONFIG_CRYPTO_TEST=3Dm

#
# Public-key cryptography
#
CONFIG_CRYPTO_RSA=3Dy
# CONFIG_CRYPTO_DH is not set
CONFIG_CRYPTO_ECC=3Dm
CONFIG_CRYPTO_ECDH=3Dm
# CONFIG_CRYPTO_ECDSA is not set
# CONFIG_CRYPTO_ECRDSA is not set
# CONFIG_CRYPTO_SM2 is not set
# CONFIG_CRYPTO_CURVE25519 is not set

#
# Authenticated Encryption with Associated Data
#
CONFIG_CRYPTO_CCM=3Dm
CONFIG_CRYPTO_GCM=3Dy
CONFIG_CRYPTO_CHACHA20POLY1305=3Dm
# CONFIG_CRYPTO_AEGIS128 is not set
CONFIG_CRYPTO_SEQIV=3Dm
CONFIG_CRYPTO_ECHAINIV=3Dm

#
# Block modes
#
CONFIG_CRYPTO_CBC=3Dy
CONFIG_CRYPTO_CFB=3Dy
CONFIG_CRYPTO_CTR=3Dy
CONFIG_CRYPTO_CTS=3Dy
CONFIG_CRYPTO_ECB=3Dy
CONFIG_CRYPTO_LRW=3Dm
# CONFIG_CRYPTO_OFB is not set
CONFIG_CRYPTO_PCBC=3Dm
CONFIG_CRYPTO_XTS=3Dm
# CONFIG_CRYPTO_KEYWRAP is not set
# CONFIG_CRYPTO_ADIANTUM is not set
# CONFIG_CRYPTO_HCTR2 is not set
CONFIG_CRYPTO_ESSIV=3Dy

#
# Hash modes
#
CONFIG_CRYPTO_CMAC=3Dm
CONFIG_CRYPTO_HMAC=3Dy
CONFIG_CRYPTO_XCBC=3Dm
CONFIG_CRYPTO_VMAC=3Dm

#
# Digest
#
CONFIG_CRYPTO_CRC32C=3Dy
# CONFIG_CRYPTO_CRC32C_VPMSUM is not set
CONFIG_CRYPTO_CRC32=3Dm
# CONFIG_CRYPTO_XXHASH is not set
# CONFIG_CRYPTO_BLAKE2B is not set
CONFIG_CRYPTO_CRCT10DIF=3Dy
# CONFIG_CRYPTO_CRCT10DIF_VPMSUM is not set
CONFIG_CRYPTO_CRC64_ROCKSOFT=3Dm
CONFIG_CRYPTO_GHASH=3Dy
CONFIG_CRYPTO_POLY1305=3Dm
CONFIG_CRYPTO_MD4=3Dm
CONFIG_CRYPTO_MD5=3Dy
# CONFIG_CRYPTO_MD5_PPC is not set
CONFIG_CRYPTO_MICHAEL_MIC=3Dm
CONFIG_CRYPTO_RMD160=3Dm
CONFIG_CRYPTO_SHA1=3Dy
# CONFIG_CRYPTO_SHA1_PPC is not set
CONFIG_CRYPTO_SHA256=3Dy
CONFIG_CRYPTO_SHA512=3Dy
CONFIG_CRYPTO_SHA3=3Dm
# CONFIG_CRYPTO_SM3_GENERIC is not set
# CONFIG_CRYPTO_STREEBOG is not set
CONFIG_CRYPTO_WP512=3Dm

#
# Ciphers
#
CONFIG_CRYPTO_AES=3Dy
# CONFIG_CRYPTO_AES_TI is not set
CONFIG_CRYPTO_ANUBIS=3Dm
CONFIG_CRYPTO_ARC4=3Dm
CONFIG_CRYPTO_BLOWFISH=3Dm
CONFIG_CRYPTO_BLOWFISH_COMMON=3Dm
CONFIG_CRYPTO_CAMELLIA=3Dm
CONFIG_CRYPTO_CAST_COMMON=3Dm
CONFIG_CRYPTO_CAST5=3Dm
CONFIG_CRYPTO_CAST6=3Dm
CONFIG_CRYPTO_DES=3Dm
CONFIG_CRYPTO_FCRYPT=3Dm
CONFIG_CRYPTO_KHAZAD=3Dm
CONFIG_CRYPTO_CHACHA20=3Dm
CONFIG_CRYPTO_SEED=3Dm
# CONFIG_CRYPTO_ARIA is not set
CONFIG_CRYPTO_SERPENT=3Dm
# CONFIG_CRYPTO_SM4_GENERIC is not set
CONFIG_CRYPTO_TEA=3Dm
CONFIG_CRYPTO_TWOFISH=3Dm
CONFIG_CRYPTO_TWOFISH_COMMON=3Dm

#
# Compression
#
CONFIG_CRYPTO_DEFLATE=3Dy
CONFIG_CRYPTO_LZO=3Dy
CONFIG_CRYPTO_842=3Dm
# CONFIG_CRYPTO_LZ4 is not set
# CONFIG_CRYPTO_LZ4HC is not set
# CONFIG_CRYPTO_ZSTD is not set

#
# Random Number Generation
#
CONFIG_CRYPTO_ANSI_CPRNG=3Dm
CONFIG_CRYPTO_DRBG_MENU=3Dy
CONFIG_CRYPTO_DRBG_HMAC=3Dy
CONFIG_CRYPTO_DRBG_HASH=3Dy
CONFIG_CRYPTO_DRBG_CTR=3Dy
CONFIG_CRYPTO_DRBG=3Dy
CONFIG_CRYPTO_JITTERENTROPY=3Dy
CONFIG_CRYPTO_USER_API=3Dy
CONFIG_CRYPTO_USER_API_HASH=3Dy
CONFIG_CRYPTO_USER_API_SKCIPHER=3Dy
CONFIG_CRYPTO_USER_API_RNG=3Dy
# CONFIG_CRYPTO_USER_API_RNG_CAVP is not set
CONFIG_CRYPTO_USER_API_AEAD=3Dy
CONFIG_CRYPTO_USER_API_ENABLE_OBSOLETE=3Dy
# CONFIG_CRYPTO_STATS is not set
CONFIG_CRYPTO_HASH_INFO=3Dy
CONFIG_CRYPTO_HW=3Dy
CONFIG_CRYPTO_DEV_NX=3Dy
CONFIG_CRYPTO_DEV_NX_COMPRESS=3Dy
CONFIG_CRYPTO_DEV_NX_COMPRESS_PSERIES=3Dy
CONFIG_CRYPTO_DEV_NX_COMPRESS_POWERNV=3Dy
# CONFIG_CRYPTO_DEV_ATMEL_ECC is not set
# CONFIG_CRYPTO_DEV_ATMEL_SHA204A is not set
# CONFIG_CRYPTO_DEV_QAT_DH895xCC is not set
# CONFIG_CRYPTO_DEV_QAT_C3XXX is not set
# CONFIG_CRYPTO_DEV_QAT_C62X is not set
# CONFIG_CRYPTO_DEV_QAT_4XXX is not set
# CONFIG_CRYPTO_DEV_QAT_DH895xCCVF is not set
# CONFIG_CRYPTO_DEV_QAT_C3XXXVF is not set
# CONFIG_CRYPTO_DEV_QAT_C62XVF is not set
CONFIG_CRYPTO_DEV_NITROX=3Dm
CONFIG_CRYPTO_DEV_NITROX_CNN55XX=3Dm
CONFIG_CRYPTO_DEV_VMX=3Dy
CONFIG_CRYPTO_DEV_VMX_ENCRYPT=3Dm
CONFIG_CRYPTO_DEV_CHELSIO=3Dm
# CONFIG_CRYPTO_DEV_VIRTIO is not set
# CONFIG_CRYPTO_DEV_SAFEXCEL is not set
# CONFIG_CRYPTO_DEV_CCREE is not set
# CONFIG_CRYPTO_DEV_AMLOGIC_GXL is not set
CONFIG_ASYMMETRIC_KEY_TYPE=3Dy
CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=3Dy
CONFIG_X509_CERTIFICATE_PARSER=3Dy
# CONFIG_PKCS8_PRIVATE_KEY_PARSER is not set
CONFIG_PKCS7_MESSAGE_PARSER=3Dy
# CONFIG_PKCS7_TEST_KEY is not set
# CONFIG_SIGNED_PE_FILE_VERIFICATION is not set
# CONFIG_FIPS_SIGNATURE_SELFTEST is not set

#
# Certificates for signature checking
#
CONFIG_MODULE_SIG_KEY=3D"certs/signing_key.pem"
CONFIG_MODULE_SIG_KEY_TYPE_RSA=3Dy
# CONFIG_MODULE_SIG_KEY_TYPE_ECDSA is not set
CONFIG_SYSTEM_TRUSTED_KEYRING=3Dy
CONFIG_SYSTEM_TRUSTED_KEYS=3D""
CONFIG_SYSTEM_EXTRA_CERTIFICATE=3Dy
CONFIG_SYSTEM_EXTRA_CERTIFICATE_SIZE=3D4096
# CONFIG_SECONDARY_TRUSTED_KEYRING is not set
CONFIG_SYSTEM_BLACKLIST_KEYRING=3Dy
CONFIG_SYSTEM_BLACKLIST_HASH_LIST=3D""
# CONFIG_SYSTEM_REVOCATION_LIST is not set
# CONFIG_SYSTEM_BLACKLIST_AUTH_UPDATE is not set
# end of Certificates for signature checking

CONFIG_BINARY_PRINTF=3Dy

#
# Library routines
#
CONFIG_RAID6_PQ=3Dm
CONFIG_RAID6_PQ_BENCHMARK=3Dy
# CONFIG_PACKING is not set
CONFIG_BITREVERSE=3Dy
CONFIG_GENERIC_STRNCPY_FROM_USER=3Dy
CONFIG_GENERIC_STRNLEN_USER=3Dy
CONFIG_GENERIC_NET_UTILS=3Dy
CONFIG_CORDIC=3Dm
CONFIG_PRIME_NUMBERS=3Dm
CONFIG_RATIONAL=3Dm
CONFIG_GENERIC_PCI_IOMAP=3Dy
CONFIG_GENERIC_IOMAP=3Dy
CONFIG_ARCH_USE_CMPXCHG_LOCKREF=3Dy
CONFIG_ARCH_HAS_FAST_MULTIPLIER=3Dy

#
# Crypto library routines
#
CONFIG_CRYPTO_LIB_AES=3Dy
CONFIG_CRYPTO_LIB_ARC4=3Dm
CONFIG_CRYPTO_LIB_BLAKE2S_GENERIC=3Dy
CONFIG_CRYPTO_LIB_CHACHA_GENERIC=3Dm
# CONFIG_CRYPTO_LIB_CHACHA is not set
# CONFIG_CRYPTO_LIB_CURVE25519 is not set
CONFIG_CRYPTO_LIB_DES=3Dm
CONFIG_CRYPTO_LIB_POLY1305_RSIZE=3D1
CONFIG_CRYPTO_LIB_POLY1305_GENERIC=3Dm
# CONFIG_CRYPTO_LIB_POLY1305 is not set
# CONFIG_CRYPTO_LIB_CHACHA20POLY1305 is not set
CONFIG_CRYPTO_LIB_SHA1=3Dy
CONFIG_CRYPTO_LIB_SHA256=3Dy
# end of Crypto library routines

CONFIG_LIB_MEMNEQ=3Dy
CONFIG_CRC_CCITT=3Dy
CONFIG_CRC16=3Dy
CONFIG_CRC_T10DIF=3Dy
CONFIG_CRC64_ROCKSOFT=3Dm
CONFIG_CRC_ITU_T=3Dm
CONFIG_CRC32=3Dy
# CONFIG_CRC32_SELFTEST is not set
CONFIG_CRC32_SLICEBY8=3Dy
# CONFIG_CRC32_SLICEBY4 is not set
# CONFIG_CRC32_SARWATE is not set
# CONFIG_CRC32_BIT is not set
CONFIG_CRC64=3Dm
# CONFIG_CRC4 is not set
CONFIG_CRC7=3Dm
CONFIG_LIBCRC32C=3Dm
CONFIG_CRC8=3Dm
CONFIG_XXHASH=3Dy
# CONFIG_RANDOM32_SELFTEST is not set
CONFIG_842_COMPRESS=3Dm
CONFIG_842_DECOMPRESS=3Dy
CONFIG_ZLIB_INFLATE=3Dy
CONFIG_ZLIB_DEFLATE=3Dy
CONFIG_LZO_COMPRESS=3Dy
CONFIG_LZO_DECOMPRESS=3Dy
CONFIG_LZ4_DECOMPRESS=3Dy
CONFIG_ZSTD_DECOMPRESS=3Dy
CONFIG_XZ_DEC=3Dy
CONFIG_XZ_DEC_X86=3Dy
CONFIG_XZ_DEC_POWERPC=3Dy
CONFIG_XZ_DEC_IA64=3Dy
CONFIG_XZ_DEC_ARM=3Dy
CONFIG_XZ_DEC_ARMTHUMB=3Dy
CONFIG_XZ_DEC_SPARC=3Dy
# CONFIG_XZ_DEC_MICROLZMA is not set
CONFIG_XZ_DEC_BCJ=3Dy
# CONFIG_XZ_DEC_TEST is not set
CONFIG_DECOMPRESS_GZIP=3Dy
CONFIG_DECOMPRESS_BZIP2=3Dy
CONFIG_DECOMPRESS_LZMA=3Dy
CONFIG_DECOMPRESS_XZ=3Dy
CONFIG_DECOMPRESS_LZO=3Dy
CONFIG_DECOMPRESS_LZ4=3Dy
CONFIG_DECOMPRESS_ZSTD=3Dy
CONFIG_GENERIC_ALLOCATOR=3Dy
CONFIG_REED_SOLOMON=3Dm
CONFIG_REED_SOLOMON_ENC8=3Dy
CONFIG_REED_SOLOMON_DEC8=3Dy
CONFIG_TEXTSEARCH=3Dy
CONFIG_TEXTSEARCH_KMP=3Dm
CONFIG_TEXTSEARCH_BM=3Dm
CONFIG_TEXTSEARCH_FSM=3Dm
CONFIG_BTREE=3Dy
CONFIG_INTERVAL_TREE=3Dy
CONFIG_XARRAY_MULTI=3Dy
CONFIG_ASSOCIATIVE_ARRAY=3Dy
CONFIG_HAS_IOMEM=3Dy
CONFIG_HAS_IOPORT_MAP=3Dy
CONFIG_HAS_DMA=3Dy
CONFIG_DMA_OPS=3Dy
CONFIG_DMA_OPS_BYPASS=3Dy
CONFIG_ARCH_HAS_DMA_MAP_DIRECT=3Dy
CONFIG_NEED_SG_DMA_LENGTH=3Dy
CONFIG_NEED_DMA_MAP_STATE=3Dy
CONFIG_ARCH_DMA_ADDR_T_64BIT=3Dy
CONFIG_DMA_DECLARE_COHERENT=3Dy
CONFIG_ARCH_HAS_FORCE_DMA_UNENCRYPTED=3Dy
CONFIG_SWIOTLB=3Dy
# CONFIG_DMA_RESTRICTED_POOL is not set
# CONFIG_DMA_API_DEBUG is not set
# CONFIG_DMA_MAP_BENCHMARK is not set
CONFIG_SGL_ALLOC=3Dy
CONFIG_IOMMU_HELPER=3Dy
CONFIG_CHECK_SIGNATURE=3Dy
CONFIG_CPU_RMAP=3Dy
CONFIG_DQL=3Dy
CONFIG_GLOB=3Dy
# CONFIG_GLOB_SELFTEST is not set
CONFIG_NLATTR=3Dy
CONFIG_CLZ_TAB=3Dy
CONFIG_IRQ_POLL=3Dy
CONFIG_MPILIB=3Dy
CONFIG_SIGNATURE=3Dy
CONFIG_DIMLIB=3Dy
CONFIG_LIBFDT=3Dy
CONFIG_OID_REGISTRY=3Dy
CONFIG_HAVE_GENERIC_VDSO=3Dy
CONFIG_GENERIC_GETTIMEOFDAY=3Dy
CONFIG_GENERIC_VDSO_TIME_NS=3Dy
CONFIG_FONT_SUPPORT=3Dy
# CONFIG_FONTS is not set
CONFIG_FONT_8x8=3Dy
CONFIG_FONT_8x16=3Dy
CONFIG_SG_POOL=3Dy
CONFIG_ARCH_HAS_PMEM_API=3Dy
CONFIG_MEMREGION=3Dy
CONFIG_ARCH_HAS_MEMREMAP_COMPAT_ALIGN=3Dy
CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE=3Dy
CONFIG_ARCH_HAS_COPY_MC=3Dy
CONFIG_ARCH_STACKWALK=3Dy
CONFIG_STACKDEPOT=3Dy
CONFIG_SBITMAP=3Dy
CONFIG_PARMAN=3Dm
CONFIG_OBJAGG=3Dm
# end of Library routines

CONFIG_PLDMFW=3Dy
CONFIG_ASN1_ENCODER=3Dy

#
# Kernel hacking
#

#
# printk and dmesg options
#
CONFIG_PRINTK_TIME=3Dy
# CONFIG_PRINTK_CALLER is not set
# CONFIG_STACKTRACE_BUILD_ID is not set
CONFIG_CONSOLE_LOGLEVEL_DEFAULT=3D7
CONFIG_CONSOLE_LOGLEVEL_QUIET=3D4
CONFIG_MESSAGE_LOGLEVEL_DEFAULT=3D4
CONFIG_DYNAMIC_DEBUG=3Dy
CONFIG_DYNAMIC_DEBUG_CORE=3Dy
CONFIG_SYMBOLIC_ERRNAME=3Dy
CONFIG_DEBUG_BUGVERBOSE=3Dy
# end of printk and dmesg options

CONFIG_DEBUG_KERNEL=3Dy
CONFIG_DEBUG_MISC=3Dy

#
# Compile-time checks and compiler options
#
CONFIG_DEBUG_INFO=3Dy
# CONFIG_DEBUG_INFO_NONE is not set
# CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT is not set
CONFIG_DEBUG_INFO_DWARF4=3Dy
# CONFIG_DEBUG_INFO_DWARF5 is not set
# CONFIG_DEBUG_INFO_REDUCED is not set
# CONFIG_DEBUG_INFO_COMPRESSED is not set
# CONFIG_DEBUG_INFO_SPLIT is not set
CONFIG_DEBUG_INFO_BTF=3Dy
CONFIG_PAHOLE_HAS_SPLIT_BTF=3Dy
CONFIG_DEBUG_INFO_BTF_MODULES=3Dy
# CONFIG_MODULE_ALLOW_BTF_MISMATCH is not set
# CONFIG_GDB_SCRIPTS is not set
CONFIG_FRAME_WARN=3D2048
CONFIG_STRIP_ASM_SYMS=3Dy
# CONFIG_READABLE_ASM is not set
# CONFIG_HEADERS_INSTALL is not set
CONFIG_DEBUG_SECTION_MISMATCH=3Dy
CONFIG_SECTION_MISMATCH_WARN_ONLY=3Dy
# CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
# end of Compile-time checks and compiler options

#
# Generic Kernel Debugging Instruments
#
CONFIG_MAGIC_SYSRQ=3Dy
CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=3D0x1
CONFIG_MAGIC_SYSRQ_SERIAL=3Dy
CONFIG_MAGIC_SYSRQ_SERIAL_SEQUENCE=3D""
CONFIG_DEBUG_FS=3Dy
CONFIG_DEBUG_FS_ALLOW_ALL=3Dy
# CONFIG_DEBUG_FS_DISALLOW_MOUNT is not set
# CONFIG_DEBUG_FS_ALLOW_NONE is not set
CONFIG_HAVE_ARCH_KGDB=3Dy
CONFIG_KGDB=3Dy
CONFIG_KGDB_HONOUR_BLOCKLIST=3Dy
CONFIG_KGDB_SERIAL_CONSOLE=3Dy
CONFIG_KGDB_TESTS=3Dy
# CONFIG_KGDB_TESTS_ON_BOOT is not set
CONFIG_KGDB_KDB=3Dy
CONFIG_KDB_DEFAULT_ENABLE=3D0x0
CONFIG_KDB_KEYBOARD=3Dy
CONFIG_KDB_CONTINUE_CATASTROPHIC=3D0
CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=3Dy
# CONFIG_UBSAN is not set
CONFIG_HAVE_KCSAN_COMPILER=3Dy
# end of Generic Kernel Debugging Instruments

#
# Networking Debugging
#
# CONFIG_NET_DEV_REFCNT_TRACKER is not set
# CONFIG_NET_NS_REFCNT_TRACKER is not set
# CONFIG_DEBUG_NET is not set
# end of Networking Debugging

#
# Memory Debugging
#
CONFIG_PAGE_EXTENSION=3Dy
# CONFIG_DEBUG_PAGEALLOC is not set
CONFIG_SLUB_DEBUG=3Dy
# CONFIG_SLUB_DEBUG_ON is not set
CONFIG_PAGE_OWNER=3Dy
# CONFIG_PAGE_POISONING is not set
# CONFIG_DEBUG_PAGE_REF is not set
# CONFIG_DEBUG_RODATA_TEST is not set
CONFIG_ARCH_HAS_DEBUG_WX=3Dy
# CONFIG_DEBUG_WX is not set
CONFIG_GENERIC_PTDUMP=3Dy
# CONFIG_PTDUMP_DEBUGFS is not set
# CONFIG_DEBUG_OBJECTS is not set
CONFIG_SHRINKER_DEBUG=3Dy
CONFIG_HAVE_DEBUG_KMEMLEAK=3Dy
# CONFIG_DEBUG_KMEMLEAK is not set
# CONFIG_DEBUG_STACK_USAGE is not set
# CONFIG_SCHED_STACK_END_CHECK is not set
CONFIG_ARCH_HAS_DEBUG_VM_PGTABLE=3Dy
# CONFIG_DEBUG_VM is not set
# CONFIG_DEBUG_VM_PGTABLE is not set
CONFIG_ARCH_HAS_DEBUG_VIRTUAL=3Dy
# CONFIG_DEBUG_VIRTUAL is not set
CONFIG_DEBUG_MEMORY_INIT=3Dy
# CONFIG_DEBUG_PER_CPU_MAPS is not set
CONFIG_HAVE_DEBUG_STACKOVERFLOW=3Dy
CONFIG_DEBUG_STACKOVERFLOW=3Dy
CONFIG_HAVE_ARCH_KASAN=3Dy
CONFIG_HAVE_ARCH_KASAN_VMALLOC=3Dy
CONFIG_ARCH_DISABLE_KASAN_INLINE=3Dy
CONFIG_CC_HAS_KASAN_GENERIC=3Dy
CONFIG_CC_HAS_WORKING_NOSANITIZE_ADDRESS=3Dy
# CONFIG_KASAN is not set
# end of Memory Debugging

CONFIG_DEBUG_SHIRQ=3Dy

#
# Debug Oops, Lockups and Hangs
#
CONFIG_PANIC_ON_OOPS=3Dy
CONFIG_PANIC_ON_OOPS_VALUE=3D1
CONFIG_LOCKUP_DETECTOR=3Dy
CONFIG_SOFTLOCKUP_DETECTOR=3Dy
# CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
CONFIG_HARDLOCKUP_DETECTOR=3Dy
# CONFIG_BOOTPARAM_HARDLOCKUP_PANIC is not set
CONFIG_DETECT_HUNG_TASK=3Dy
CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=3D120
# CONFIG_BOOTPARAM_HUNG_TASK_PANIC is not set
# CONFIG_WQ_WATCHDOG is not set
# CONFIG_TEST_LOCKUP is not set
# end of Debug Oops, Lockups and Hangs

#
# Scheduler Debugging
#
CONFIG_SCHED_DEBUG=3Dy
CONFIG_SCHED_INFO=3Dy
CONFIG_SCHEDSTATS=3Dy
# end of Scheduler Debugging

# CONFIG_DEBUG_TIMEKEEPING is not set

#
# Lock Debugging (spinlocks, mutexes, etc...)
#
CONFIG_LOCK_DEBUGGING_SUPPORT=3Dy
# CONFIG_PROVE_LOCKING is not set
# CONFIG_LOCK_STAT is not set
# CONFIG_DEBUG_RT_MUTEXES is not set
# CONFIG_DEBUG_SPINLOCK is not set
# CONFIG_DEBUG_MUTEXES is not set
# CONFIG_DEBUG_WW_MUTEX_SLOWPATH is not set
# CONFIG_DEBUG_RWSEMS is not set
# CONFIG_DEBUG_LOCK_ALLOC is not set
# CONFIG_DEBUG_ATOMIC_SLEEP is not set
# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
CONFIG_LOCK_TORTURE_TEST=3Dm
# CONFIG_WW_MUTEX_SELFTEST is not set
# CONFIG_SCF_TORTURE_TEST is not set
# CONFIG_CSD_LOCK_WAIT_DEBUG is not set
# end of Lock Debugging (spinlocks, mutexes, etc...)

# CONFIG_DEBUG_IRQFLAGS is not set
CONFIG_STACKTRACE=3Dy
# CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set
# CONFIG_DEBUG_KOBJECT is not set

#
# Debug kernel data structures
#
CONFIG_DEBUG_LIST=3Dy
# CONFIG_DEBUG_PLIST is not set
# CONFIG_DEBUG_SG is not set
# CONFIG_DEBUG_NOTIFIERS is not set
CONFIG_BUG_ON_DATA_CORRUPTION=3Dy
# end of Debug kernel data structures

# CONFIG_DEBUG_CREDENTIALS is not set

#
# RCU Debugging
#
CONFIG_TORTURE_TEST=3Dm
# CONFIG_RCU_SCALE_TEST is not set
# CONFIG_RCU_TORTURE_TEST is not set
# CONFIG_RCU_REF_SCALE_TEST is not set
CONFIG_RCU_CPU_STALL_TIMEOUT=3D60
CONFIG_RCU_EXP_CPU_STALL_TIMEOUT=3D0
# CONFIG_RCU_TRACE is not set
# CONFIG_RCU_EQS_DEBUG is not set
# end of RCU Debugging

# CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
# CONFIG_CPU_HOTPLUG_STATE_CONTROL is not set
# CONFIG_LATENCYTOP is not set
CONFIG_NOP_TRACER=3Dy
CONFIG_HAVE_FUNCTION_TRACER=3Dy
CONFIG_HAVE_FUNCTION_GRAPH_TRACER=3Dy
CONFIG_HAVE_DYNAMIC_FTRACE=3Dy
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=3Dy
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS=3Dy
CONFIG_HAVE_FTRACE_MCOUNT_RECORD=3Dy
CONFIG_HAVE_SYSCALL_TRACEPOINTS=3Dy
CONFIG_HAVE_C_RECORDMCOUNT=3Dy
CONFIG_TRACER_MAX_TRACE=3Dy
CONFIG_TRACE_CLOCK=3Dy
CONFIG_RING_BUFFER=3Dy
CONFIG_EVENT_TRACING=3Dy
CONFIG_CONTEXT_SWITCH_TRACER=3Dy
CONFIG_TRACING=3Dy
CONFIG_GENERIC_TRACER=3Dy
CONFIG_TRACING_SUPPORT=3Dy
CONFIG_FTRACE=3Dy
# CONFIG_BOOTTIME_TRACING is not set
CONFIG_FUNCTION_TRACER=3Dy
CONFIG_FUNCTION_GRAPH_TRACER=3Dy
CONFIG_DYNAMIC_FTRACE=3Dy
CONFIG_DYNAMIC_FTRACE_WITH_REGS=3Dy
CONFIG_DYNAMIC_FTRACE_WITH_ARGS=3Dy
# CONFIG_FUNCTION_PROFILER is not set
CONFIG_STACK_TRACER=3Dy
# CONFIG_IRQSOFF_TRACER is not set
CONFIG_SCHED_TRACER=3Dy
CONFIG_HWLAT_TRACER=3Dy
# CONFIG_OSNOISE_TRACER is not set
# CONFIG_TIMERLAT_TRACER is not set
CONFIG_FTRACE_SYSCALLS=3Dy
CONFIG_TRACER_SNAPSHOT=3Dy
# CONFIG_TRACER_SNAPSHOT_PER_CPU_SWAP is not set
CONFIG_BRANCH_PROFILE_NONE=3Dy
# CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
CONFIG_BLK_DEV_IO_TRACE=3Dy
CONFIG_KPROBE_EVENTS=3Dy
# CONFIG_KPROBE_EVENTS_ON_NOTRACE is not set
CONFIG_UPROBE_EVENTS=3Dy
CONFIG_BPF_EVENTS=3Dy
CONFIG_DYNAMIC_EVENTS=3Dy
CONFIG_PROBE_EVENTS=3Dy
# CONFIG_BPF_KPROBE_OVERRIDE is not set
CONFIG_FTRACE_MCOUNT_RECORD=3Dy
CONFIG_FTRACE_MCOUNT_USE_RECORDMCOUNT=3Dy
CONFIG_TRACING_MAP=3Dy
CONFIG_SYNTH_EVENTS=3Dy
CONFIG_HIST_TRIGGERS=3Dy
# CONFIG_TRACE_EVENT_INJECT is not set
# CONFIG_TRACEPOINT_BENCHMARK is not set
CONFIG_RING_BUFFER_BENCHMARK=3Dm
# CONFIG_TRACE_EVAL_MAP_FILE is not set
# CONFIG_FTRACE_RECORD_RECURSION is not set
# CONFIG_FTRACE_STARTUP_TEST is not set
# CONFIG_RING_BUFFER_STARTUP_TEST is not set
# CONFIG_RING_BUFFER_VALIDATE_TIME_DELTAS is not set
# CONFIG_PREEMPTIRQ_DELAY_TEST is not set
# CONFIG_SYNTH_EVENT_GEN_TEST is not set
# CONFIG_KPROBE_EVENT_GEN_TEST is not set
# CONFIG_HIST_TRIGGERS_DEBUG is not set
# CONFIG_RV is not set
# CONFIG_SAMPLES is not set
CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=3Dy
CONFIG_STRICT_DEVMEM=3Dy
# CONFIG_IO_STRICT_DEVMEM is not set

#
# powerpc Debugging
#
CONFIG_PPC_DISABLE_WERROR=3Dy
CONFIG_PRINT_STACK_DEPTH=3D64
# CONFIG_HCALL_STATS is not set
CONFIG_PPC_EMULATED_STATS=3Dy
CONFIG_CODE_PATCHING_SELFTEST=3Dy
CONFIG_JUMP_LABEL_FEATURE_CHECKS=3Dy
CONFIG_JUMP_LABEL_FEATURE_CHECK_DEBUG=3Dy
CONFIG_FTR_FIXUP_SELFTEST=3Dy
CONFIG_MSI_BITMAP_SELFTEST=3Dy
CONFIG_PPC_IRQ_SOFT_MASK_DEBUG=3Dy
CONFIG_PPC_RFI_SRR_DEBUG=3Dy
CONFIG_XMON=3Dy
# CONFIG_XMON_DEFAULT is not set
CONFIG_XMON_DISASSEMBLY=3Dy
CONFIG_XMON_DEFAULT_RO_MODE=3Dy
CONFIG_DEBUGGER=3Dy
CONFIG_BOOTX_TEXT=3Dy
# CONFIG_PPC_EARLY_DEBUG is not set
# CONFIG_PPC_FAST_ENDIAN_SWITCH is not set
# end of powerpc Debugging

#
# Kernel Testing and Coverage
#
CONFIG_KUNIT=3Dm
CONFIG_KUNIT_DEBUGFS=3Dy
CONFIG_KUNIT_TEST=3Dm
CONFIG_KUNIT_EXAMPLE_TEST=3Dm
CONFIG_KUNIT_ALL_TESTS=3Dm
# CONFIG_NOTIFIER_ERROR_INJECTION is not set
CONFIG_FUNCTION_ERROR_INJECTION=3Dy
# CONFIG_FAULT_INJECTION is not set
CONFIG_ARCH_HAS_KCOV=3Dy
CONFIG_CC_HAS_SANCOV_TRACE_PC=3Dy
CONFIG_RUNTIME_TESTING_MENU=3Dy
# CONFIG_LKDTM is not set
CONFIG_TEST_CPUMASK=3Dm
# CONFIG_TEST_LIST_SORT is not set
# CONFIG_TEST_MIN_HEAP is not set
# CONFIG_TEST_SORT is not set
# CONFIG_TEST_DIV64 is not set
# CONFIG_KPROBES_SANITY_TEST is not set
# CONFIG_BACKTRACE_SELF_TEST is not set
# CONFIG_TEST_REF_TRACKER is not set
# CONFIG_RBTREE_TEST is not set
# CONFIG_REED_SOLOMON_TEST is not set
# CONFIG_INTERVAL_TREE_TEST is not set
# CONFIG_PERCPU_TEST is not set
CONFIG_ATOMIC64_SELFTEST=3Dy
CONFIG_ASYNC_RAID6_TEST=3Dm
# CONFIG_TEST_HEXDUMP is not set
# CONFIG_STRING_SELFTEST is not set
# CONFIG_TEST_STRING_HELPERS is not set
# CONFIG_TEST_STRSCPY is not set
CONFIG_TEST_KSTRTOX=3Dy
# CONFIG_TEST_PRINTF is not set
# CONFIG_TEST_SCANF is not set
# CONFIG_TEST_BITMAP is not set
# CONFIG_TEST_UUID is not set
# CONFIG_TEST_XARRAY is not set
# CONFIG_TEST_RHASHTABLE is not set
# CONFIG_TEST_SIPHASH is not set
# CONFIG_TEST_IDA is not set
# CONFIG_TEST_PARMAN is not set
# CONFIG_TEST_LKM is not set
# CONFIG_TEST_BITOPS is not set
# CONFIG_TEST_VMALLOC is not set
# CONFIG_TEST_USER_COPY is not set
CONFIG_TEST_BPF=3Dm
# CONFIG_TEST_BLACKHOLE_DEV is not set
# CONFIG_FIND_BIT_BENCHMARK is not set
# CONFIG_TEST_FIRMWARE is not set
# CONFIG_TEST_SYSCTL is not set
# CONFIG_BITFIELD_KUNIT is not set
CONFIG_HASH_KUNIT_TEST=3Dm
# CONFIG_RESOURCE_KUNIT_TEST is not set
CONFIG_SYSCTL_KUNIT_TEST=3Dm
CONFIG_LIST_KUNIT_TEST=3Dm
# CONFIG_LINEAR_RANGES_TEST is not set
# CONFIG_CMDLINE_KUNIT_TEST is not set
# CONFIG_BITS_TEST is not set
CONFIG_SLUB_KUNIT_TEST=3Dm
CONFIG_RATIONAL_KUNIT_TEST=3Dm
CONFIG_MEMCPY_KUNIT_TEST=3Dm
CONFIG_OVERFLOW_KUNIT_TEST=3Dm
CONFIG_STACKINIT_KUNIT_TEST=3Dm
# CONFIG_TEST_UDELAY is not set
# CONFIG_TEST_STATIC_KEYS is not set
# CONFIG_TEST_KMOD is not set
# CONFIG_TEST_MEMCAT_P is not set
CONFIG_TEST_LIVEPATCH=3Dm
# CONFIG_TEST_OBJAGG is not set
# CONFIG_TEST_MEMINIT is not set
# CONFIG_TEST_HMM is not set
# CONFIG_TEST_FREE_PAGES is not set
CONFIG_ARCH_USE_MEMTEST=3Dy
# CONFIG_MEMTEST is not set
# end of Kernel Testing and Coverage

#
# Rust hacking
#
# end of Rust hacking
# end of Kernel hacking

--Apple-Mail=_F77DD4EB-DD43-432F-A9C5-D25E6ABB98D2--

