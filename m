Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B9125E262
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Sep 2020 22:08:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bjpdn6v8nzDql6
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Sep 2020 06:08:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::743;
 helo=mail-qk1-x743.google.com; envelope-from=danielhb413@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=EKMaP3YV; dkim-atps=neutral
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bjpc76STGzDqpq
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Sep 2020 06:07:03 +1000 (AEST)
Received: by mail-qk1-x743.google.com with SMTP id o5so7518376qke.12
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Sep 2020 13:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=0xBO3zE7WrjPyMPbqBPcLrCJczWo9lshPs8Qpt1Ddhk=;
 b=EKMaP3YVb8n+rUdBn0LjHjNNm8ad2dgatbz3dvOvFtLuVZQ+robW52eXSvo0WhOqWB
 FEd/itOiZKNOYZy0WnPWhqDSQrD+gxhSVTemx73PY6J43EqhXeL71rbaC3E37dNSxQ/H
 wqqCcnTFC2Q6WpRXCCGrzd2ndo3adTUInRIJ967moon6lBaciePikju9dX2Q4kCNUD2T
 mVne4qYt2bWizuF2Vb3Qv6lDekGnUfT1PC7zfk6KCtwJPukgi/EBuOxE4wm7CDXEgvFM
 iunZjU5jj09/EnS3rObSV/WaxafiWVyUmSa6WEdgZQ1Hw2HA/4i9S0FebkcJE7D5HDhO
 ylzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0xBO3zE7WrjPyMPbqBPcLrCJczWo9lshPs8Qpt1Ddhk=;
 b=FDi2XwQogAWSQNYK94g+rr83CaKLlzRWRNreFUHnv9I2vOM0aP261nDrw/ky4PWrvl
 aMN15HelkRN45aNPN5pCuls2QaHBJT6fdXbdYgUIbij8wl+v4L8VZlXgDhQCoMhJTIrQ
 auszXlOhJl4m10ZYlGkI5z+VuknWZZT3+mmtwk9uatygsrBfByYZKF7ZIh0K8Gt9oii0
 61Gl33NCDdNtwUIZpVFHpvuYy0PAErOhT1xKbQwSM6iqvunehYAyc8FgrxDG5kicXv/f
 BKp69oK8l01wg4s7ucxfz5P9p7yy2HDNBdqG9teYB7RUifgNFuytJYjK3uq8Aape2bdp
 uIYw==
X-Gm-Message-State: AOAM530bL+1+MSRybxEJBVSI/QW7TESG057+NqEP+jaC9Fl2Xme1I9dq
 1S3oHwSIyZTG0YxoQUHUOFjNsF/YyNk=
X-Google-Smtp-Source: ABdhPJxv6DO0xWAn8om5rH4VxcIOMPZc9kpcD+eL3+be9S2IGOSXk8TgMQHii3sk876AlxGU1m0GtA==
X-Received: by 2002:a37:e305:: with SMTP id y5mr8055449qki.315.1599250020882; 
 Fri, 04 Sep 2020 13:07:00 -0700 (PDT)
Received: from ?IPv6:2804:431:c7c6:1dc:ffbd:d3fb:97ff:aaca?
 ([2804:431:c7c6:1dc:ffbd:d3fb:97ff:aaca])
 by smtp.gmail.com with ESMTPSA id k22sm2758487qkk.13.2020.09.04.13.06.59
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Sep 2020 13:07:00 -0700 (PDT)
Subject: Re: [PATCH 0/1] powerpc/numa: do not skip node 0 in lookup table
To: linuxppc-dev@lists.ozlabs.org
References: <20200814203413.542050-1-danielhb413@gmail.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <5e8fbea3-8faf-0951-172a-b41a2138fbcf@gmail.com>
Date: Fri, 4 Sep 2020 17:06:57 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200814203413.542050-1-danielhb413@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

I discussed this a bit with Aneesh Kumar in IBM internal Slack, a few weeks
ago, and he informed me that that this patch does not make sense with the
design used by the kernel. The kernel will assume that, for node 0, all
associativity domains must also be zeroed. This is why node 0 is skipped
when creating the distance table.

This of course has consequences for QEMU, so based on that, I've adapted
the QEMU implementation to not touch node 0.



Daniel

On 8/14/20 5:34 PM, Daniel Henrique Barboza wrote:
> Hi,
> 
> This is a simple fix that I made while testing NUMA changes
> I'm making in QEMU [1]. Setting any non-zero value to the
> associativity of NUMA node 0 has no impact in the output
> of 'numactl' because the distance_lookup_table is never
> initialized for node 0.
> 
> Seeing through the LOPAPR spec and git history I found no
> technical reason to skip node 0, which makes me believe this is
> a bug that got under the radar up until now because no one
> attempted to set node 0 associativity like I'm doing now.
> 
> For anyone wishing to give it a spin, using the QEMU build
> in [1] and experimenting with NUMA distances, such as:
> 
> sudo ./qemu-system-ppc64 -machine pseries-5.2,accel=kvm,usb=off,dump-guest-core=off -m 65536 -overcommit mem-lock=off -smp 4,sockets=4,cores=1,threads=1 -rtc base=utc -display none -vga none -nographic -boot menu=on -device spapr-pci-host-bridge,index=1,id=pci.1 -device spapr-pci-host-bridge,index=2,id=pci.2 -device spapr-pci-host-bridge,index=3,id=pci.3 -device spapr-pci-host-bridge,index=4,id=pci.4 -device qemu-xhci,id=usb,bus=pci.0,addr=0x2 -drive file=/home/danielhb/f32.qcow2,format=qcow2,if=none,id=drive-virtio-disk0 -device virtio-blk-pci,scsi=off,bus=pci.0,addr=0x3,drive=drive-virtio-disk0,id=virtio-disk0,bootindex=1 -device usb-kbd,id=input0,bus=usb.0,port=1 -device usb-mouse,id=input1,bus=usb.0,port=2 -device virtio-balloon-pci,id=balloon0,bus=pci.0,addr=0x4 -msg timestamp=on \
> -numa node,nodeid=0,cpus=0 -numa node,nodeid=1,cpus=1 \
> -numa node,nodeid=2,cpus=2 -numa node,nodeid=3,cpus=3 \
> -numa dist,src=0,dst=1,val=80 -numa dist,src=0,dst=2,val=80 \
> -numa dist,src=0,dst=3,val=80 -numa dist,src=1,dst=2,val=80 \
> -numa dist,src=1,dst=3,val=80 -numa dist,src=2,dst=3,val=80
> 
> The current kernel code will ignore the associativity of
> node 0, and numactl will output this:
> 
> node distances:
> node   0   1   2   3
>    0:  10  160  160  160
>    1:  160  10  80  80
>    2:  160  80  10  80
>    3:  160  80  80  10
> 
> With this patch:
> 
> node distances:
> node   0   1   2   3
>    0:  10  160  160  160
>    1:  160  10  80  40
>    2:  160  80  10  20
>    3:  160  40  20  10
> 
> 
> If anyone wonders, this patch has no conflict with the proposed
> NUMA changes in [2] because Aneesh isn't changing this line.
> 
> 
> [1] https://github.com/danielhb/qemu/tree/spapr_numa_v1
> [2] https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20200731111916.243569-1-aneesh.kumar@linux.ibm.com/
> 
> 
> Daniel Henrique Barboza (1):
>    powerpc/numa: do not skip node 0 when init lookup table
> 
>   arch/powerpc/mm/numa.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
