Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3702E0605
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Dec 2020 07:25:40 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D0RD02m8vzDqQS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Dec 2020 17:25:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d35;
 helo=mail-io1-xd35.google.com; envelope-from=natechancellor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=bYLuiH1o; dkim-atps=neutral
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D0RBQ3mwjzDqPw
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Dec 2020 17:24:09 +1100 (AEDT)
Received: by mail-io1-xd35.google.com with SMTP id p187so11068266iod.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Dec 2020 22:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=dvYfLYsFfS43bvrF26hnW/hEbzAkRm7Scm+LXEgVfVU=;
 b=bYLuiH1oTcVZ/I6H0OVBdf9f3YqrefhYZAyEJdB5TC6xIKwxPhaupenWHD8bSvukj0
 He9SW7p+RSa3NctkxTKoYhyCXsQPtHrNaN3konj8LhUdsMyFg6dYKP9JkwuJcwIKBX+x
 LQNKv/FIMS3Jp/cK8Y2hSSLoJ8L7CRNV6OFIS+9oh51CT6iIyayvGHHtGV6tNw1tkCXo
 yY4qAYEgguc8HVzEP2A0py/XKMmpWcWza2KurgLXLItdf2rSC9YVrmEErjlfj+dTJPxY
 nZn42AO/OFiptOlofA5Z7FguNSPvqFi8mtf0cDfV7fU65ZLc/y39YQY+S+600ASWJrYp
 uWYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dvYfLYsFfS43bvrF26hnW/hEbzAkRm7Scm+LXEgVfVU=;
 b=CElUTseq4k7QPXfn53ZkmFAF51CtpTiOXgufZAU4oSA49nbu6kPL2LvDIy9/LRZMUj
 3AhN0IbqbO4uABFeQT1jvxA2W0LHkaTtfkE9a32QbuoJIFgCVGdQIEOs8BZBKs7MTSvN
 wEVIAmFtrxTCy4KXPQTLDnzonbLumxDvlTPtmb5LlhtQBmIOZpfzzmXd7pp8u8980iPJ
 bBlL7R06wI/b966ONMk3oKGnX/2FVyQhT++0fCss2HTBffa/PFHyBm4G3xr3BIHRd1GC
 f88+rWw4BEYN6K2rgxDjRGiCKgqAyv8/UmoLh+zrD4nx9t65KwCHhXWkkjatDEGT1KVt
 AcWQ==
X-Gm-Message-State: AOAM531mEemXoWGShGdN3J5qcuB7CMNbc0MjFCWTzksJiw1cXRaeZWeh
 +UHB8WEgKODxDltFsJ0ukNY=
X-Google-Smtp-Source: ABdhPJxB9wDBA5Ngh+kgnMjiLRbev4Rw8UPKgrWjlAhWtRksNN90MssBBP9rj+JfCQ0GrrHiwWXSRw==
X-Received: by 2002:a6b:3bc3:: with SMTP id
 i186mr16958974ioa.192.1608618245892; 
 Mon, 21 Dec 2020 22:24:05 -0800 (PST)
Received: from ubuntu-m3-large-x86 ([2604:1380:45f1:1d00::1])
 by smtp.gmail.com with ESMTPSA id x5sm14561731ilm.22.2020.12.21.22.24.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 22:24:05 -0800 (PST)
Date: Mon, 21 Dec 2020 23:24:03 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Tyrel Datwyler <tyreld@linux.ibm.com>
Subject: Re: [PATCH 3/3] ibmvfc: use correlation token to tag commands
Message-ID: <20201222062403.GA2190683@ubuntu-m3-large-x86>
References: <20201117185031.129939-1-tyreld@linux.ibm.com>
 <20201117185031.129939-3-tyreld@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201117185031.129939-3-tyreld@linux.ibm.com>
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
Cc: martin.petersen@oracle.com, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, james.bottomley@hansenpartnership.com,
 clang-built-linux@googlegroups.com, brking@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Nov 17, 2020 at 12:50:31PM -0600, Tyrel Datwyler wrote:
> The vfcFrame correlation field is 64bit handle that is intended to trace
> I/O operations through both the client stack and VIOS stack when the
> underlying physical FC adapter supports tagging.
> 
> Tag vfcFrames with the associated ibmvfc_event pointer handle.
> 
> Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
> ---
>  drivers/scsi/ibmvscsi/ibmvfc.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
> index 0cab4b852b48..3922441a117d 100644
> --- a/drivers/scsi/ibmvscsi/ibmvfc.c
> +++ b/drivers/scsi/ibmvscsi/ibmvfc.c
> @@ -1693,6 +1693,8 @@ static int ibmvfc_queuecommand_lck(struct scsi_cmnd *cmnd,
>  		vfc_cmd->iu.pri_task_attr = IBMVFC_SIMPLE_TASK;
>  	}
>  
> +	vfc_cmd->correlation = cpu_to_be64(evt);
> +
>  	if (likely(!(rc = ibmvfc_map_sg_data(cmnd, evt, vfc_cmd, vhost->dev))))
>  		return ibmvfc_send_event(evt, vhost, 0);
>  
> @@ -2370,6 +2372,8 @@ static int ibmvfc_abort_task_set(struct scsi_device *sdev)
>  		tmf->iu.tmf_flags = IBMVFC_ABORT_TASK_SET;
>  		evt->sync_iu = &rsp_iu;
>  
> +		tmf->correlation = cpu_to_be64(evt);
> +
>  		init_completion(&evt->comp);
>  		rsp_rc = ibmvfc_send_event(evt, vhost, default_timeout);
>  	}
> -- 
> 2.27.0
> 

This patch introduces a clang warning, is this intentional behavior?

$ make -skj"$(nproc)" ARCH=powerpc CROSS_COMPILE=powerpc64le-linux-gnu- LLVM=1 O=out distclean ppc64le_defconfig drivers/scsi/ibmvscsi/ibmvfc.o
Using ../arch/powerpc/configs/ppc64_defconfig as base
Merging ../arch/powerpc/configs/le.config
#
# merged configuration written to .config (needs make)
#
../drivers/scsi/ibmvscsi/ibmvfc.c:1747:25: warning: incompatible pointer to integer conversion passing 'struct ibmvfc_event *' to parameter of type '__u64' (aka 'unsigned long long') [-Wint-conversion]
        vfc_cmd->correlation = cpu_to_be64(evt);
                               ^~~~~~~~~~~~~~~~
../include/linux/byteorder/generic.h:92:21: note: expanded from macro 'cpu_to_be64'
#define cpu_to_be64 __cpu_to_be64
                    ^
../include/uapi/linux/byteorder/little_endian.h:37:52: note: expanded from macro '__cpu_to_be64'
#define __cpu_to_be64(x) ((__force __be64)__swab64((x)))
                                          ~~~~~~~~~^~~~
../include/uapi/linux/swab.h:133:12: note: expanded from macro '__swab64'
        __fswab64(x))
                  ^
../include/uapi/linux/swab.h:66:57: note: passing argument to parameter 'val' here
static inline __attribute_const__ __u64 __fswab64(__u64 val)
                                                        ^
../drivers/scsi/ibmvscsi/ibmvfc.c:2421:22: warning: incompatible pointer to integer conversion passing 'struct ibmvfc_event *' to parameter of type '__u64' (aka 'unsigned long long') [-Wint-conversion]
                tmf->correlation = cpu_to_be64(evt);
                                   ^~~~~~~~~~~~~~~~
../include/linux/byteorder/generic.h:92:21: note: expanded from macro 'cpu_to_be64'
#define cpu_to_be64 __cpu_to_be64
                    ^
../include/uapi/linux/byteorder/little_endian.h:37:52: note: expanded from macro '__cpu_to_be64'
#define __cpu_to_be64(x) ((__force __be64)__swab64((x)))
                                          ~~~~~~~~~^~~~
../include/uapi/linux/swab.h:133:12: note: expanded from macro '__swab64'
        __fswab64(x))
                  ^
../include/uapi/linux/swab.h:66:57: note: passing argument to parameter 'val' here
static inline __attribute_const__ __u64 __fswab64(__u64 val)
                                                        ^
2 warnings generated.

Cheers,
Nathan
