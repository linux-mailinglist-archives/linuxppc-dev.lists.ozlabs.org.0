Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E7E180128
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Mar 2020 16:06:25 +0100 (CET)
Received: from lists.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48cJML0QPNzDqRN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Mar 2020 02:06:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.68; helo=mail-ot1-f68.google.com;
 envelope-from=mstsxfx@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48cJFt3GhvzDqGv
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Mar 2020 02:01:37 +1100 (AEDT)
Received: by mail-ot1-f68.google.com with SMTP id a9so7231034otl.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Mar 2020 08:01:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dX3tIfhg8Pgw7VaqAcNR8DRUcVBfEcC2G/jhaGAghMc=;
 b=IGsyARgl2CE+/+lXrcgO5KFmsj5zXZ8sNWmAkb8L+Xt+mWIQ+CeeJoDc2Y/d5//twF
 062Rdfn623mKMx8E4gVeWdkwQqpEYuwHo296OqSItWEN/25kTn5mVlOFgXJiv83G2gkR
 hkXGlrRX4tKyfRzFUcRfd/IhXfPJ0Qt0nZq8w3A9WIQYpM7FVtP5tEXthoL1ox4orEdi
 LUQW/KFZXWgsTsf3udKifkaywKoSxZIMDQ/Y3Fsud+/Y5iUCZktwhyvHTt/y2y2ss5Ec
 kybEcaH1gxia2n83Ec9JLzwFzijDX9/NN5gWosbAqboZK/v4hJCc2aw4RHP1Aq4NaXce
 xESA==
X-Gm-Message-State: ANhLgQ1aRRsNLwhcQgthL1lbb+Ejh/YG6oC5xwhwm8pJSc+A1BTSwZ+N
 /xFFEX1cwzC+7eYTN3M+YdM=
X-Google-Smtp-Source: ADFU+vuQuFenZSPppKiEGnjSnrmQcdZgNpbb5fhlH5HInmerm41VCtvaEccg65uDW45jDgzov0aZXA==
X-Received: by 2002:a9d:4798:: with SMTP id b24mr10336276otf.243.1583852480995; 
 Tue, 10 Mar 2020 08:01:20 -0700 (PDT)
Received: from localhost (prg-ext-pat.suse.com. [213.151.95.130])
 by smtp.gmail.com with ESMTPSA id z23sm11802570otm.79.2020.03.10.08.01.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2020 08:01:19 -0700 (PDT)
Date: Tue, 10 Mar 2020 16:01:14 +0100
From: Michal Hocko <mhocko@kernel.org>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [5.6.0-rc2-next-20200218/powerpc] Boot failure on POWER9
Message-ID: <20200310150114.GO8447@dhcp22.suse.cz>
References: <alpine.DEB.2.21.2002220337030.2000@www.lameter.com>
 <20200224085812.GB22443@dhcp22.suse.cz>
 <alpine.DEB.2.21.2002261823270.8012@www.lameter.com>
 <20200226184152.GQ3771@dhcp22.suse.cz>
 <c412ee69-80f9-b013-67d4-3b0a2f6aff7f@suse.cz>
 <dd450314-d428-6776-af07-f92c04c7b967@suse.cz>
 <20200227121214.GE3771@dhcp22.suse.cz>
 <52EF4673-7292-4C4C-B459-AF583951BA48@linux.vnet.ibm.com>
 <9a86f865-50b5-7483-9257-dbb08fecd62b@suse.cz>
 <20200227182650.GG3771@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200227182650.GG3771@dhcp22.suse.cz>
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>, Pekka Enberg <penberg@kernel.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>, David Rientjes <rientjes@google.com>,
 Christopher Lameter <cl@linux.com>, linuxppc-dev@lists.ozlabs.org,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>, Kirill Tkhai <ktkhai@virtuozzo.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu 27-02-20 19:26:54, Michal Hocko wrote:
> [Cc ppc maintainers]
[...]
> Please have a look at http://lkml.kernel.org/r/52EF4673-7292-4C4C-B459-AF583951BA48@linux.vnet.ibm.com
> for the boot log with the debugging patch which tracks set_numa_mem.
> This seems to lead to a crash in the slab allocator bebcause
> node_to_mem_node(0) for memory less node resolves to the memory less
> node http://lkml.kernel.org/r/dd450314-d428-6776-af07-f92c04c7b967@suse.cz.
> The original report is http://lkml.kernel.org/r/3381CD91-AB3D-4773-BA04-E7A072A63968@linux.vnet.ibm.com

ping 
-- 
Michal Hocko
SUSE Labs
