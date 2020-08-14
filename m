Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 85EF9244F36
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Aug 2020 22:36:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BSwFd5VgBzDqmC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Aug 2020 06:36:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::844;
 helo=mail-qt1-x844.google.com; envelope-from=danielhb413@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=iEy0AEY5; dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BSwCT5gKkzDqlP
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Aug 2020 06:34:29 +1000 (AEST)
Received: by mail-qt1-x844.google.com with SMTP id v22so7927735qtq.8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Aug 2020 13:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KjeibKdz49vXtORSfdf4/yq728PMjiex7RBj6JjEoG4=;
 b=iEy0AEY57vaZ5Wd0flAh78RWDtG1t/GiHjVYoQRKC+sV8ctW0z97sHEQySk5ygYe15
 xQ0nfuIttfx+3V/B9sGnzA1PlbOBVSP8XdCyQdQmN0taBwWEvC/DXfG2VYz4y7AH8WNH
 VtzCoCU9slFNk1uilBtN2P0ShRmCgOBYb9PCredbtjPjYWjq40GdkEsXePhIISVXdDNF
 cyxq9eTwBdxgRWVtDOF30dyDh2Z+TfrciMdNCBYfq6H4OhCQT71qTGJmj0j2MuBZF6bK
 dBx4nM5gZlx3hPSnnkOcxR9SXEkpY3/mpaljl0Nje+C9B/pVpG6J8+DLM1KF6knPXnK8
 rP6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KjeibKdz49vXtORSfdf4/yq728PMjiex7RBj6JjEoG4=;
 b=TKII87USEJouD5H8SPyYajhk4CRPd4p05IIujgfz0r1iaYb+1K4nNorPvQ5mrpsV7d
 vK/Q9qA37AaaKPpGvkXqPDIlo0Ch1cBjp6s+z7JHrehDC3Apy8nXEnSddMHYKQrLOOQj
 NvGG9U04XynkCMy12KuLUZhdHUfsEgzsWZioxRN5A0B1+7bSDSeMT0K7k8q3Fb5/iR20
 Pw3Q/L6CpMam+QPv6UG0BYXX9eRvuiz/powgU2gX5W+bghCkZwFmU//3JJn4QxFTWjsR
 srCKJw2Gy1WfZbuqIQnDrhp8qWY1OtVw1eEc7fy9raUNGT2xGCdB+oI6X1mvTX/vYuEq
 4bOQ==
X-Gm-Message-State: AOAM530pXoGJKjMMSygsfawblkYxS222wqi7gL/btjlSV29Fx23B3zqo
 2NJ8Map9DZc5W0F4uAwF/TwXiid3XcyyrA==
X-Google-Smtp-Source: ABdhPJxKUQFTCGCKQxepMyEwmq9iu2Cdu2ZqYKwuYCGzAfiAjUZv24bX/WB+HT+hC6W43z106Xf4Dg==
X-Received: by 2002:ac8:6ec1:: with SMTP id f1mr3855608qtv.165.1597437265500; 
 Fri, 14 Aug 2020 13:34:25 -0700 (PDT)
Received: from rekt.ibmuc.com ([2804:431:c7c6:303f:d1dc:35d8:e9f6:c8b])
 by smtp.gmail.com with ESMTPSA id l29sm11395121qtu.88.2020.08.14.13.34.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Aug 2020 13:34:24 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 0/1] powerpc/numa: do not skip node 0 in lookup table
Date: Fri, 14 Aug 2020 17:34:12 -0300
Message-Id: <20200814203413.542050-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

This is a simple fix that I made while testing NUMA changes
I'm making in QEMU [1]. Setting any non-zero value to the
associativity of NUMA node 0 has no impact in the output
of 'numactl' because the distance_lookup_table is never
initialized for node 0.

Seeing through the LOPAPR spec and git history I found no
technical reason to skip node 0, which makes me believe this is
a bug that got under the radar up until now because no one
attempted to set node 0 associativity like I'm doing now.

For anyone wishing to give it a spin, using the QEMU build
in [1] and experimenting with NUMA distances, such as:

sudo ./qemu-system-ppc64 -machine pseries-5.2,accel=kvm,usb=off,dump-guest-core=off -m 65536 -overcommit mem-lock=off -smp 4,sockets=4,cores=1,threads=1 -rtc base=utc -display none -vga none -nographic -boot menu=on -device spapr-pci-host-bridge,index=1,id=pci.1 -device spapr-pci-host-bridge,index=2,id=pci.2 -device spapr-pci-host-bridge,index=3,id=pci.3 -device spapr-pci-host-bridge,index=4,id=pci.4 -device qemu-xhci,id=usb,bus=pci.0,addr=0x2 -drive file=/home/danielhb/f32.qcow2,format=qcow2,if=none,id=drive-virtio-disk0 -device virtio-blk-pci,scsi=off,bus=pci.0,addr=0x3,drive=drive-virtio-disk0,id=virtio-disk0,bootindex=1 -device usb-kbd,id=input0,bus=usb.0,port=1 -device usb-mouse,id=input1,bus=usb.0,port=2 -device virtio-balloon-pci,id=balloon0,bus=pci.0,addr=0x4 -msg timestamp=on \
-numa node,nodeid=0,cpus=0 -numa node,nodeid=1,cpus=1 \
-numa node,nodeid=2,cpus=2 -numa node,nodeid=3,cpus=3 \
-numa dist,src=0,dst=1,val=80 -numa dist,src=0,dst=2,val=80 \
-numa dist,src=0,dst=3,val=80 -numa dist,src=1,dst=2,val=80 \
-numa dist,src=1,dst=3,val=80 -numa dist,src=2,dst=3,val=80

The current kernel code will ignore the associativity of
node 0, and numactl will output this:

node distances:
node   0   1   2   3 
  0:  10  160  160  160 
  1:  160  10  80  80 
  2:  160  80  10  80 
  3:  160  80  80  10 

With this patch:

node distances:
node   0   1   2   3 
  0:  10  160  160  160 
  1:  160  10  80  40 
  2:  160  80  10  20 
  3:  160  40  20  10 


If anyone wonders, this patch has no conflict with the proposed
NUMA changes in [2] because Aneesh isn't changing this line.


[1] https://github.com/danielhb/qemu/tree/spapr_numa_v1
[2] https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20200731111916.243569-1-aneesh.kumar@linux.ibm.com/


Daniel Henrique Barboza (1):
  powerpc/numa: do not skip node 0 when init lookup table

 arch/powerpc/mm/numa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.26.2

