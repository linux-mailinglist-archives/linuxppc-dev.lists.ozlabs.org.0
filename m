Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF0B69AF8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2019 20:43:05 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45nXTg1rSPzDqTF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2019 04:43:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lca.pw
 (client-ip=2607:f8b0:4864:20::743; helo=mail-qk1-x743.google.com;
 envelope-from=cai@lca.pw; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lca.pw header.i=@lca.pw header.b="A6DMZnvn"; 
 dkim-atps=neutral
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45nXRh3n7CzDqSK
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2019 04:41:19 +1000 (AEST)
Received: by mail-qk1-x743.google.com with SMTP id s22so12436829qkj.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jul 2019 11:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j+9pC2xqquVo+jvt1ectcc4GSmk+RdwlAE7AOP5s5Ks=;
 b=A6DMZnvne9aJXQCXMkN5BfpoobqmwYDJQa5KQvp0bXPRhVplnwt57bw0Gi+uKv94Dg
 gfQSCjTDlvoBOCYnnDw9CKC2mWFJPQkcQ4o41BT3KWb9ihb7TntYnDYLI/znY9A4EMpj
 +PEIObKKxi1e9GHiE40v6mr5cMYpohReOOVeySGOrZg45VnvaOHwjI51tjD826cCKSN9
 gvFQMgFse44VUR7oBiUweqXK/yVBzYHfTTw4otEgtWcB7VqYwphGS52Livko2C9l5bjm
 CvERxKiw6ahqxcelcrZaf7F2ttbegixdE9kSjcoV4QVNX/1mCJJEHSH3N0Xe0juImO8F
 WUlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j+9pC2xqquVo+jvt1ectcc4GSmk+RdwlAE7AOP5s5Ks=;
 b=IUSE+t5I4X6nqS5F+923hnfXhVW+XbaXxDPRWBrrYQ1oCUcbv5b+XfEEwF3JJeXcQ3
 AYLskAJINfzU6uX+2hGEQuyQdgOgCFgG/i7NKhhav79f9VKhDx5bbxUhxM2Bd7p7bs48
 D9rfO363ooRNRaBM/wbuxom35Jzke+XaQU+rd4VXoUg/SlMCTi2rwP8YlfsDoWSTmx4Q
 6iq5S6W2+xR8cPRPCCH7DGbJ+ztDiEyXxCga+ViC1EokEJMKX8V4bf9iDJBx0oswdLTw
 4oMPT+78S0Gj/oX0ZJ87z3ch0SkefIuaGjBHhqs/GcmKV8NiI+xhhrlTa2DH8A/FJbzH
 mhew==
X-Gm-Message-State: APjAAAVb0mHBb04oG+rqkUUOEhMCupXGW6zUlgCQmm5q+88LhbWgOL3n
 oxC2VSTH4MLfY1VF2uonKmglPg==
X-Google-Smtp-Source: APXvYqyAAffQgMKToQxFoMUCcxJWjQHAwPhA6jjOLNLAR/LFmTnPpEL6kICbMB3MEI0093xxHvgmUQ==
X-Received: by 2002:a37:660c:: with SMTP id a12mr17868757qkc.52.1563216077288; 
 Mon, 15 Jul 2019 11:41:17 -0700 (PDT)
Received: from dhcp-41-57.bos.redhat.com (nat-pool-bos-t.redhat.com.
 [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id t76sm9119376qke.79.2019.07.15.11.41.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 15 Jul 2019 11:41:16 -0700 (PDT)
Message-ID: <1563216075.4610.3.camel@lca.pw>
Subject: Re: [PATCH v2] powerpc/imc: Dont create debugfs files for cpu-less
 nodes
From: Qian Cai <cai@lca.pw>
To: Michael Ellerman <mpe@ellerman.id.au>, Madhavan Srinivasan
 <maddy@linux.vnet.ibm.com>
Date: Mon, 15 Jul 2019 14:41:15 -0400
In-Reply-To: <87d0ihgojp.fsf@concordia.ellerman.id.au>
References: <20190702092112.4015-1-maddy@linux.vnet.ibm.com>
 <87d0ihgojp.fsf@concordia.ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6 (3.22.6-10.el7) 
Mime-Version: 1.0
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2019-07-11 at 14:53 +1000, Michael Ellerman wrote:
> Hi Maddy,
> 
> Madhavan Srinivasan <maddy@linux.vnet.ibm.com> writes:
> > diff --git a/arch/powerpc/platforms/powernv/opal-imc.c
> > b/arch/powerpc/platforms/powernv/opal-imc.c
> > index 186109bdd41b..e04b20625cb9 100644
> > --- a/arch/powerpc/platforms/powernv/opal-imc.c
> > +++ b/arch/powerpc/platforms/powernv/opal-imc.c
> > @@ -69,20 +69,20 @@ static void export_imc_mode_and_cmd(struct device_node
> > *node,
> >  	if (of_property_read_u32(node, "cb_offset", &cb_offset))
> >  		cb_offset = IMC_CNTL_BLK_OFFSET;
> >  
> > -	for_each_node(nid) {
> > -		loc = (u64)(pmu_ptr->mem_info[chip].vbase) + cb_offset;
> > +	while (ptr->vbase != NULL) {
> 
> This means you'll bail out as soon as you find a node with no vbase, but
> it's possible we could have a CPU-less node intermingled with other
> nodes.
> 
> So I think you want to keep the for loop, but continue if you see a NULL
> vbase?

Not sure if this will also takes care of some of those messages during the boot
on today's linux-next even without this patch.


[   18.077780][    T1] debugfs: Directory 'imc' with parent 'powerpc' already
present!

where it has the following layout,
# numactl -H
available: 6 nodes (0,8,252-255)
node 0 cpus: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25
26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52
53 54 55 56 57 58 59 60 61 62 63
node 0 size: 130197 MB
node 0 free: 127453 MB
node 8 cpus: 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85
86 87 88 89 90 91 92 93 94 95 96 97 98 99 100 101 102 103 104 105 106 107 108
109 110 111 112 113 114 115 116 117 118 119 120 121 122 123 124 125 126 127
node 8 size: 130778 MB
node 8 free: 128119 MB
node 252 cpus:
node 252 size: 0 MB
node 252 free: 0 MB
node 253 cpus:
node 253 size: 0 MB
node 253 free: 0 MB
node 254 cpus:
node 254 size: 0 MB
node 254 free: 0 MB
node 255 cpus:
node 255 size: 0 MB
node 255 free: 0 MB
node distances:
node   0   8  252  253  254  255 
  0:  10  40  80  80  80  80 
  8:  40  10  80  80  80  80 
 252:  80  80  10  80  80  80 
 253:  80  80  80  10  80  80 
 254:  80  80  80  80  10  80 
 255:  80  80  80  80  80  10

> 
> 
> > +		loc = (u64)(ptr->vbase) + cb_offset;
> >  		imc_mode_addr = (u64 *)(loc + IMC_CNTL_BLK_MODE_OFFSET);
> > -		sprintf(mode, "imc_mode_%d", nid);
> > +		sprintf(mode, "imc_mode_%d", (u32)(ptr->id));
> >  		if (!imc_debugfs_create_x64(mode, 0600, imc_debugfs_parent,
> >  					    imc_mode_addr))
> >  			goto err;
> >  
> >  		imc_cmd_addr = (u64 *)(loc + IMC_CNTL_BLK_CMD_OFFSET);
> > -		sprintf(cmd, "imc_cmd_%d", nid);
> > +		sprintf(cmd, "imc_cmd_%d", (u32)(ptr->id));
> >  		if (!imc_debugfs_create_x64(cmd, 0600, imc_debugfs_parent,
> >  					    imc_cmd_addr))
> >  			goto err;
> > -		chip++;
> > +		ptr++;
> >  	}
> >  	return;
> 
> cheers
