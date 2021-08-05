Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EC95F3E115D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Aug 2021 11:34:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GgNjq6TJdz3cHR
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Aug 2021 19:34:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QvPsGzeV;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QvPsGzeV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=lvivier@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=QvPsGzeV; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=QvPsGzeV; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GgNjJ60vJz2ym7
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Aug 2021 19:34:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628156046;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H25u9fM8ENw6CwEf7oT44OXo4+xO0lrwwwE6fd0l1QQ=;
 b=QvPsGzeV9bl4OycWcVVIvznsvJ1kEz+yx7nPVE+pI8UyM5TjdBU10zmXg9DzS+AFoRAelb
 /6j8jNj8aQGVYGToqApI+AtNrB0vzfOiILc+GqkSPhYf2oDmy0QYfBpvKHOGA0EJ1+ySKw
 shd/Bewnuq+UpUhqf6QCkmL3XIe/HXU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628156046;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H25u9fM8ENw6CwEf7oT44OXo4+xO0lrwwwE6fd0l1QQ=;
 b=QvPsGzeV9bl4OycWcVVIvznsvJ1kEz+yx7nPVE+pI8UyM5TjdBU10zmXg9DzS+AFoRAelb
 /6j8jNj8aQGVYGToqApI+AtNrB0vzfOiILc+GqkSPhYf2oDmy0QYfBpvKHOGA0EJ1+ySKw
 shd/Bewnuq+UpUhqf6QCkmL3XIe/HXU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-Oxpr3CVJPR2h6s8uF1igZQ-1; Thu, 05 Aug 2021 05:34:04 -0400
X-MC-Unique: Oxpr3CVJPR2h6s8uF1igZQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 q13-20020a05600000cdb02901545f1bdac1so1728999wrx.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Aug 2021 02:34:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=H25u9fM8ENw6CwEf7oT44OXo4+xO0lrwwwE6fd0l1QQ=;
 b=aD3pnAH66TyjEv/AKb9TbTB9rt8Y3Q68R5LbAbZCx/C2Nt6+1qJaCOum+bTmEnBZau
 KldyGvgDRcYlgqYVxXRXPBSk4eQ3MlSJUsTDSEiyXnqW/3pI8kGJQcRV4xXlfvjwMWb9
 nkVAyG9x6A/IDhuyd/5XORzr6E+vlQ5N+ZMxR1SJTmLsf13APjxQNh5cN3hHEvDjfjFy
 9Sw1d1OlZfCUBTpXcogzWpxTaivOlgSXmZJ2VfqBAFZI2crNTW2/3W76jtLfPToFCm24
 RFqlIwAuib4bsocXM4eHfriytTkgR2VB6YMippPMJ7OE0y/PFiPnbqrIyAVin7xvUhLI
 OBxg==
X-Gm-Message-State: AOAM530+yDoYh4EmZJ4gvhsFlUtEw/RjmHtoT9m/ztn3Ts+Nf1hoslVh
 7+jmFoy7LB4YXf9vK7dDDKoSFeEZUWKFiRj4mxjMcyY0fqvu/OoUVK+jidWjyS7b3E20PgeWbTw
 xAVY3UcuVsYbeQ7I1saH7x5B/9w==
X-Received: by 2002:a7b:c041:: with SMTP id u1mr3880069wmc.95.1628156043044;
 Thu, 05 Aug 2021 02:34:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyNB13g8RqX5lk0m1yCRlIBblhZJTxs8HUWLdAFLBfaakdwjRrtdsz1JEY/pV3EEZVeHVMefw==
X-Received: by 2002:a7b:c041:: with SMTP id u1mr3880049wmc.95.1628156042841;
 Thu, 05 Aug 2021 02:34:02 -0700 (PDT)
Received: from [192.168.100.42] ([82.142.21.182])
 by smtp.gmail.com with ESMTPSA id t16sm5802483wmi.13.2021.08.05.02.34.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 02:34:02 -0700 (PDT)
Subject: Re: [PATCH v15 7/9] powerpc: Set ARCH_HAS_STRICT_MODULE_RWX
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20210609013431.9805-1-jniethe5@gmail.com>
 <20210609013431.9805-8-jniethe5@gmail.com>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <f7624d58-80e1-6912-1867-7874f1a569f5@redhat.com>
Date: Thu, 5 Aug 2021 11:34:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210609013431.9805-8-jniethe5@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
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
Cc: ajd@linux.ibm.com, aneesh.kumar@linux.ibm.com, Greg Kurz <groug@kaod.org>,
 npiggin@gmail.com, cmr@codefail.de, kvm-ppc@vger.kernel.org,
 naveen.n.rao@linux.ibm.com, David Gibson <david@gibson.dropbear.id.au>,
 dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On 09/06/2021 03:34, Jordan Niethe wrote:
> From: Russell Currey <ruscur@russell.cc>
> 
> To enable strict module RWX on powerpc, set:
> 
>     CONFIG_STRICT_MODULE_RWX=y
> 
> You should also have CONFIG_STRICT_KERNEL_RWX=y set to have any real
> security benefit.
> 
> ARCH_HAS_STRICT_MODULE_RWX is set to require ARCH_HAS_STRICT_KERNEL_RWX.
> This is due to a quirk in arch/Kconfig and arch/powerpc/Kconfig that
> makes STRICT_MODULE_RWX *on by default* in configurations where
> STRICT_KERNEL_RWX is *unavailable*.
> 
> Since this doesn't make much sense, and module RWX without kernel RWX
> doesn't make much sense, having the same dependencies as kernel RWX
> works around this problem.
> 
> Book3s/32 603 and 604 core processors are not able to write protect
> kernel pages so do not set ARCH_HAS_STRICT_MODULE_RWX for Book3s/32.
> 
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Signed-off-by: Russell Currey <ruscur@russell.cc>
> [jpn: - predicate on !PPC_BOOK3S_604
>       - make module_alloc() use PAGE_KERNEL protection]
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> ---
> v10: - Predicate on !PPC_BOOK3S_604
>      - Make module_alloc() use PAGE_KERNEL protection
> v11: - Neaten up
> v13: Use strict_kernel_rwx_enabled()
> v14: Make changes to module_alloc() its own commit
> v15: - Force STRICT_KERNEL_RWX if STRICT_MODULE_RWX is selected
>      - Predicate on !PPC_BOOK3S_32 instead
> ---
>  arch/powerpc/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index abfe2e9225fa..72f307f1796b 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -142,6 +142,7 @@ config PPC
>  	select ARCH_HAS_SCALED_CPUTIME		if VIRT_CPU_ACCOUNTING_NATIVE && PPC_BOOK3S_64
>  	select ARCH_HAS_SET_MEMORY
>  	select ARCH_HAS_STRICT_KERNEL_RWX	if ((PPC_BOOK3S_64 || PPC32) && !HIBERNATION)
> +	select ARCH_HAS_STRICT_MODULE_RWX	if ARCH_HAS_STRICT_KERNEL_RWX && !PPC_BOOK3S_32
>  	select ARCH_HAS_TICK_BROADCAST		if GENERIC_CLOCKEVENTS_BROADCAST
>  	select ARCH_HAS_UACCESS_FLUSHCACHE
>  	select ARCH_HAS_UBSAN_SANITIZE_ALL
> @@ -267,6 +268,7 @@ config PPC
>  	select PPC_DAWR				if PPC64
>  	select RTC_LIB
>  	select SPARSE_IRQ
> +	select STRICT_KERNEL_RWX if STRICT_MODULE_RWX
>  	select SYSCTL_EXCEPTION_TRACE
>  	select THREAD_INFO_IN_TASK
>  	select VIRT_TO_BUS			if !PPC64
> 

since this patch is merged my VM is experiencing a crash at boot (20% of the time):

[    8.496850] kernel tried to execute exec-protected page (c008000004073278) - exploit
attempt? (uid: 0)
[    8.496921] BUG: Unable to handle kernel instruction fetch
[    8.496954] Faulting instruction address: 0xc008000004073278
[    8.496994] Oops: Kernel access of bad area, sig: 11 [#1]
[    8.497028] LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA pSeries
[    8.497071] Modules linked in: drm virtio_console fuse drm_panel_orientation_quirks xfs
libcrc32c virtio_net net_failover virtio_blk vmx_crypto failover dm_mirror dm_region_hash
dm_log dm_mod
[    8.497186] CPU: 3 PID: 44 Comm: kworker/3:1 Not tainted 5.14.0-rc4+ #12
[    8.497228] Workqueue: events control_work_handler [virtio_console]
[    8.497272] NIP:  c008000004073278 LR: c008000004073278 CTR: c0000000001e9de0
[    8.497320] REGS: c00000002e4ef7e0 TRAP: 0400   Not tainted  (5.14.0-rc4+)
[    8.497361] MSR:  800000004280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 24002822
XER: 200400cf
[    8.497426] CFAR: c0000000001e9e44 IRQMASK: 1
[    8.497426] GPR00: c008000004073278 c00000002e4efa80 c000000002a26b00 c000000042c39520
[    8.497426] GPR04: 0000000000000001 0000000000000000 0000000000000000 00000000000000ff
[    8.497426] GPR08: 0000000000000001 c000000042c39520 0000000000000001 c008000004076008
[    8.497426] GPR12: c0000000001e9de0 c0000001fffccb00 c00000000018ba88 c00000002c91d400
[    8.497426] GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
[    8.497426] GPR20: 0000000000000000 0000000000000000 0000000000000000 c008000004080340
[    8.497426] GPR24: c0080000040a01e8 0000000000000000 0000000000000000 c00000002e0975c0
[    8.497426] GPR28: c00000002ce72940 c000000042c39520 0000000000000048 0000000000000038
[    8.497891] NIP [c008000004073278] fill_queue+0xf0/0x210 [virtio_console]
[    8.497934] LR [c008000004073278] fill_queue+0xf0/0x210 [virtio_console]
[    8.497976] Call Trace:
[    8.497993] [c00000002e4efa80] [c00800000407323c] fill_queue+0xb4/0x210
[virtio_console] (unreliable)
[    8.498052] [c00000002e4efae0] [c008000004073a90] add_port+0x1a8/0x470 [virtio_console]
[    8.498102] [c00000002e4efbb0] [c0080000040750f4] control_work_handler+0xbc/0x1e8
[virtio_console]
[    8.498160] [c00000002e4efc60] [c00000000017f4f0] process_one_work+0x290/0x590
[    8.498212] [c00000002e4efd00] [c00000000017f878] worker_thread+0x88/0x620
[    8.498256] [c00000002e4efda0] [c00000000018bc14] kthread+0x194/0x1a0
[    8.498299] [c00000002e4efe10] [c00000000000cf54] ret_from_kernel_thread+0x5c/0x64
[    8.498349] Instruction dump:
[    8.498374] 7da96b78 a14d0c8a 419c00b0 2f8a0000 419eff88 b32d0c8a 7c0004ac 4bffff7c
[    8.498430] 60000000 60000000 7fa3eb78 48002d95 <e8410018> 38600000 480025e1 e8410018
[    8.498485] ---[ end trace 16ee10903290b647 ]---
[    8.501433]
[    9.502601] Kernel panic - not syncing: Fatal exception

add_port+0x1a8/0x470 :

  1420	
  1421		/* We can safely ignore ENOSPC because it means
  1422		 * the queue already has buffers. Buffers are removed
  1423		 * only by virtcons_remove(), not by unplug_port()
  1424		 */
->1425		err = fill_queue(port->in_vq, &port->inbuf_lock);
  1426		if (err < 0 && err != -ENOSPC) {
  1427			dev_err(port->dev, "Error allocating inbufs\n");
  1428			goto free_device;
  1429		}

fill_queue+0x90/0x210 :

  1326	static int fill_queue(struct virtqueue *vq, spinlock_t *lock)
  1327	{
  1328		struct port_buffer *buf;
  1329		int nr_added_bufs;
  1330		int ret;
  1331	
  1332		nr_added_bufs = 0;
  1333		do {
  1334			buf = alloc_buf(vq->vdev, PAGE_SIZE, 0);
  1335			if (!buf)
  1336				return -ENOMEM;
  1337	
->1338			spin_lock_irq(lock);

I'm using an upstream kernel (5.14-rc4, 251a1524293d) in the VM.

My host is a RHEL 8.5/POWER9: qemu-kvm-6.0.0-21 and kernel-4.18.0-325

My qemu command line is:

/usr/libexec/qemu-kvm \
-M pseries,accel=kvm \
-nographic -nodefaults \
-device virtio-serial-pci \
-device virtconsole \
-device virtio-net-pci,mac=9a:2b:2c:2d:2e:2f,netdev=hostnet0  \
-blockdev
node-name=disk1,file.driver=file,driver=qcow2,file.driver=file,file.filename=disk.qcow2 \
-netdev bridge,id=hostnet0,br=virbr0,helper=/usr/libexec/qemu-bridge-helper \
-device virtio-blk-pci,id=image1,drive=disk1 \
-m 8192  \
-smp 4 \
-serial mon:stdio


Do we need something in qemu/kvm to support STRICT_MODULE_RWX ?

Thanks,
Laurent

