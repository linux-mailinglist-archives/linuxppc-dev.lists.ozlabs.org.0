Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFD120ACAB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jun 2020 09:00:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49tSTM1VC5zDr0N
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jun 2020 17:00:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.120;
 helo=us-smtp-1.mimecast.com; envelope-from=jstancek@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=LmAD1qyi; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=MDmsZXeR; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49tSRh3TG8zDqxf
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jun 2020 16:59:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593154761;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  in-reply-to:in-reply-to; 
 bh=aupLyG0sRMZZEEbarg6G9YjK+MT5+HL5pnYP2m3BwC4=;
 b=LmAD1qyiYLfykN16Qk8aeUC+l6PfqXp8FSm0RTPdFxL1q1cEZWM78+nkj2G0yTMw7mdrML
 3zyqFgltNsRK4BaJGBJ1VIJ7B6NNNZfy7vTI0Rk1P4ZYE9NA+nV+vKx3uXyBcvlqRX85o3
 kKC/HV2/JcTgErQD80Pcq7k1sWKv/X4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593154762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  in-reply-to:in-reply-to; 
 bh=aupLyG0sRMZZEEbarg6G9YjK+MT5+HL5pnYP2m3BwC4=;
 b=MDmsZXeR2yt71oOifCUAGLXFyOTqAqfHiwhoFYaUkGdWOCSJ84T7NYPusQNUlJG8sccdAo
 MIDAFnQmrGTKqjf1CJleQeO+lmpJq51dQarKgqNn01RslyoBKhh5gzKqta45QnswQOJvAS
 MNEr05yXUbnqWTRP7LlVqy7D5iRke3M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-CUUYw9UgMX6cwByuz4rMlg-1; Fri, 26 Jun 2020 02:59:17 -0400
X-MC-Unique: CUUYw9UgMX6cwByuz4rMlg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D769804003;
 Fri, 26 Jun 2020 06:59:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D73511CC28;
 Fri, 26 Jun 2020 06:59:16 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1C8B618095FF;
 Fri, 26 Jun 2020 06:59:15 +0000 (UTC)
Date: Fri, 26 Jun 2020 02:59:15 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: linuxppc-dev@lists.ozlabs.org, aneesh.kumar@linux.ibm.com, 
 sandipan@linux.ibm.com
Message-ID: <2065283975.18780128.1593154755849.JavaMail.zimbra@redhat.com>
In-Reply-To: <1402271372.18777802.1593153800272.JavaMail.zimbra@redhat.com>
Subject: [bug] LTP mmap03 stuck in page fault loop after c46241a370a6
 ("powerpc/pkeys: Check vma before returning key fault error to the user")
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.19]
Thread-Topic: LTP mmap03 stuck in page fault loop after c46241a370a6
 ("powerpc/pkeys: Check vma before returning key fault error to the user")
Thread-Index: uuN6Cg7MxKIh0nCENVpG+jh8K37ajQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
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
Cc: Rachel Sibley <rasibley@redhat.com>, Jan Stancek <jstancek@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

LTP mmap03 is getting stuck in page fault loop after commit
  c46241a370a6 ("powerpc/pkeys: Check vma before returning key fault error to the user")

System is ppc64le P9 lpar [1] running v5.8-rc2-34-g3e08a95294a4.

Here's a minimized reproducer:
------------------------- 8< -----------------------------
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/mman.h>

int main(int ac, char **av)
{
        int page_sz = getpagesize();
        int fildes;
        char *addr;

        fildes = open("tempfile", O_WRONLY | O_CREAT, 0666);
        write(fildes, &fildes, sizeof(fildes));
        close(fildes);

        fildes = open("tempfile", O_RDONLY);
        unlink("tempfile");

        addr = mmap(0, page_sz, PROT_EXEC, MAP_FILE | MAP_PRIVATE, fildes, 0);

        printf("%d\n", *addr);
        return 0;
}
------------------------- >8 -----------------------------

This would previously end quickly with segmentation fault, after
commit c46241a370a6 test is stuck:

# perf stat timeout 5 ./a.out

 Performance counter stats for 'timeout 5 ./a.out':

          5,001.74 msec task-clock                #    1.000 CPUs utilized
                 9      context-switches          #    0.002 K/sec
                 0      cpu-migrations            #    0.000 K/sec
         3,094,893      page-faults               #    0.619 M/sec
    18,940,869,512      cycles                    #    3.787 GHz                      (33.39%)
     1,377,005,087      stalled-cycles-frontend   #    7.27% frontend cycles idle     (50.19%)
    10,949,936,056      stalled-cycles-backend    #   57.81% backend cycles idle      (16.62%)
    21,133,828,748      instructions              #    1.12  insn per cycle
                                                  #    0.52  stalled cycles per insn  (33.22%)
     4,395,016,137      branches                  #  878.698 M/sec                    (49.81%)
       164,499,002      branch-misses             #    3.74% of all branches          (16.60%)

       5.001237248 seconds time elapsed

       0.321276000 seconds user
       4.680772000 seconds sys


access_pkey_error() in page fault handler now always seem to return false:

  __do_page_fault
    access_pkey_error(is_pkey: 1, is_exec: 0, is_write: 0)
      arch_vma_access_permitted
        pkey_access_permitted
          if (!is_pkey_enabled(pkey))
            return true
      return false

Regards,
Jan

[1]
Architecture:                    ppc64le
Byte Order:                      Little Endian
CPU(s):                          8
On-line CPU(s) list:             0-7
Thread(s) per core:              8
Core(s) per socket:              1
Socket(s):                       1
NUMA node(s):                    2
Model:                           2.2 (pvr 004e 0202)
Model name:                      POWER9 (architected), altivec supported
Hypervisor vendor:               pHyp
Virtualization type:             para
L1d cache:                       32 KiB
L1i cache:                       32 KiB
NUMA node0 CPU(s):
NUMA node1 CPU(s):               0-7
Physical sockets:                2
Physical chips:                  1
Physical cores/chip:             8
Vulnerability Itlb multihit:     Not affected
Vulnerability L1tf:              Mitigation; RFI Flush, L1D private per thread
Vulnerability Mds:               Not affected
Vulnerability Meltdown:          Mitigation; RFI Flush, L1D private per thread
Vulnerability Spec store bypass: Mitigation; Kernel entry/exit barrier (eieio)
Vulnerability Spectre v1:        Mitigation; __user pointer sanitization, ori31 speculation barrier enabled
Vulnerability Spectre v2:        Mitigation; Indirect branch cache disabled, Software link stack flush
Vulnerability Srbds:             Not affected
Vulnerability Tsx async abort:   Not affected

