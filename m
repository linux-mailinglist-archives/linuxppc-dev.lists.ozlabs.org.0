Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 779E0AA600
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2019 16:35:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46PNX7037YzDqsZ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Sep 2019 00:35:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lca.pw
 (client-ip=2607:f8b0:4864:20::842; helo=mail-qt1-x842.google.com;
 envelope-from=cai@lca.pw; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lca.pw header.i=@lca.pw header.b="YUS/Lirb"; 
 dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46PNPv3dH2zDr0V
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Sep 2019 00:30:09 +1000 (AEST)
Received: by mail-qt1-x842.google.com with SMTP id k10so3058306qth.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Sep 2019 07:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y5SqPKw+eQauSARI3e7prNN2KoPrq6IiDIlL7ozwmws=;
 b=YUS/LirbfUeEH6j8oqy1lBBdLDuxiPUCcALpk0Hc8m6PUiQ7G4O1VAbZpXB3p4Ggvs
 pu9j9dwe0Rw2cJlOJd7aXrc4NPjo7q2FdIG6QptITVOMqNuGsARNijn5QXbf5EXEGraD
 ITyjVjY/tkgVZO1BZWAHg/5I+DpMItKGorWYoWVLob4JCbhYqzvPm5irhvrf4BBmHnIS
 pUL1RaLk/10Q+p9r1fUle5S/ZkcjIoIZpJS6yNFAFApfxggrEV0RKNss/PQuhL/cbtov
 y7aWo/VzQ18/j2TnwBm70is0Z6ojeCUJKOtM6WLVxBQRKd2a4e1Wem65pvx3t083SQoU
 Z40Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y5SqPKw+eQauSARI3e7prNN2KoPrq6IiDIlL7ozwmws=;
 b=tND0ItwpCRnffIjO3PYNuMECzHv4bpCaAuW3aE1LnqJJQJNppxwpv1iv3BMaNIWBen
 cteuQXhASJw8FAmFHoqGdmOCPY/iIduZx7jP0r/yIOqEZ/OidFJqBN8cZLJxUrq9bdzm
 h15GVYNllPy9bum3HIn5svT1qM+QCMD0ZTW8aOZUKJi3lfGIf4Op4vawDOhUDRvMJfSY
 4LXIfbNXvsQQDKAbxeyV7epdUqUijRIuy0gtaRHxR2UtVgcVhITVxhAQrcdevD+SsWfI
 EVJO8wrlQgBF/FI1lUxnf9aYchL3oL4kOIsuBN4NYcZtSBWLU8HY4ke8CtUnuC1ZtZjj
 aLmQ==
X-Gm-Message-State: APjAAAWpdTfrOY1LwItVCO/eICtaNvEzC6eZE0/osOd+f2/AuPmjXDmp
 HhjeUm9dEGBQxsTxqawHIkJfyw==
X-Google-Smtp-Source: APXvYqxcdKN38EPysNNewvg4TKYlHffHO0KLI9alERc/45IMpFAyjIK/F7Cu91FwzUjFmJeERuER8g==
X-Received: by 2002:a0c:e706:: with SMTP id d6mr1872330qvn.58.1567693806689;
 Thu, 05 Sep 2019 07:30:06 -0700 (PDT)
Received: from dhcp-41-57.bos.redhat.com (nat-pool-bos-t.redhat.com.
 [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id t185sm1042277qkb.15.2019.09.05.07.30.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 05 Sep 2019 07:30:05 -0700 (PDT)
Message-ID: <1567693804.5576.93.camel@lca.pw>
Subject: Re: lockdep warning while booting POWER9 PowerNV
From: Qian Cai <cai@lca.pw>
To: Michael Ellerman <mpe@ellerman.id.au>, Bart Van Assche <bvanassche@acm.org>
Date: Thu, 05 Sep 2019 10:30:04 -0400
In-Reply-To: <87ef0vpfbc.fsf@mpe.ellerman.id.au>
References: <1567199630.5576.39.camel@lca.pw>
 <9b8b287a-4ae1-ca9b-cff1-6d93672b6893@acm.org>
 <87ef0vpfbc.fsf@mpe.ellerman.id.au>
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
Cc: Peter Zijlstra <peterz@infradead.org>, linuxppc-dev@lists.ozlabs.org,
 Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2019-09-05 at 13:55 +1000, Michael Ellerman wrote:
> Bart Van Assche <bvanassche@acm.org> writes:
> > On 8/30/19 2:13 PM, Qian Cai wrote:
> > > https://raw.githubusercontent.com/cailca/linux-mm/master/powerpc.config
> > > 
> > > Once in a while, booting an IBM POWER9 PowerNV system (8335-GTH) would
> > > generate
> > > a warning in lockdep_register_key() at,
> > > 
> > > if (WARN_ON_ONCE(static_obj(key)))
> > > 
> > > because
> > > 
> > > key = 0xc0000000019ad118
> > > &_stext = 0xc000000000000000
> > > &_end = 0xc0000000049d0000
> > > 
> > > i.e., it will cause static_obj() returns 1.
> > 
> > (back from a trip)
> > 
> > Hi Qian,
> > 
> > Does this mean that on POWER9 it can happen that a dynamically allocated 
> > object has an address that falls between &_stext and &_end?
> 
> I thought that was true on all arches due to initmem, but seems not.
> 
> I guess we have the same problem as s390 and we need to define
> arch_is_kernel_initmem_freed().

Actually, it is in the .bss section. The commit 2d4f567103ff ("KVM: PPC:
Introduce kvm_tmp framework") adds kvm_tmp[] into the .bss section and then free
the rest of unused spaces back to the page allocator.

kernel_init
  kvm_guest_init
    kvm_free_tmp
      free_reserved_area
        free_unref_page
          free_unref_page_prepare

Later, alloc_workqueue() happens to allocate some pages from there, and triggers
the warning. Not sure what the best way to solve this.
