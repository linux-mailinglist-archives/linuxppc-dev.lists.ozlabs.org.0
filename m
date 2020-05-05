Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CEFF41C5E68
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 May 2020 19:09:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49GmRX5tmZzDqh2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 03:09:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=rientjes@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=O5i7do4i; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49GmPN4vsXzDqTs
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 May 2020 03:07:36 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id y25so1168769pfn.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 May 2020 10:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=vBqzVx+qxfalnXJK7KTGtarAHizzhkjQWkeOeL25v0I=;
 b=O5i7do4icdhMgjwpo9TCdui1mhr1arbAoT6CXE/FL4FNU3azDor8xRsQqnf1oekzW/
 7Qdnbc7WereNZhHIyoLYjd3kSqw20Zgo4WpUa6FDM3lp00UVK8MuXDFlE01cNDiRoL/O
 EAJ+Ut2sB0upkwibNjvyQBcsbJtaD+jjUHszOCYm3fAaoq1qP93jucL3eyvdClOkn4r9
 aH+4c51iqcLP9pbxn4M3XH4t32uYqryQbnelLqdVh/XN7PZz087P/5s0HNVg2D8n0IWM
 Us9QoDxYRHRAsocKaYP+GGGf+vkaem3+rBmS0NeZS6uvBlq/NtEMkGqiIrBNdRSUHVrW
 Rf/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=vBqzVx+qxfalnXJK7KTGtarAHizzhkjQWkeOeL25v0I=;
 b=G8zadu3xPjFtODtwezKdN0ruvoApKNHI4le7ZRrQkx0t5K2BmUfgKDSoxA3fKyMLFf
 swQB4RFomGiLmXeU/mvdHD7SLC1LCsQRlDkF3M3yUuoe4KdLlPQ9seRutMih72yv5u80
 fnY7XwNKtV8ef9OqENo32VSvKqQMk9Y4Lvm4Yon7zHZkopjfNjoFahUB0/bke0v3SnhC
 4YFs+Zo+l75y1+qOjSKoZd1dd6ziCn3rV/4pCt/7dcntNU76QGhewjTojcnNxdOEPLhB
 FtYRDp4Hentm2PXCzib498EU3IDvI8p3sTut3Ew6PJ63I0eTyuN3Lx2rxprcMKNujXWd
 MEsg==
X-Gm-Message-State: AGi0PuYfHT6oVPSGNAS9fHmBnriIpgaZF3M4Iqcbv8n4ZyErbaePJfsu
 mtUiP+BK6rIkEqcQ/cQYDfw/TQ==
X-Google-Smtp-Source: APiQypL1cJk6Ptxu94QvTpoApcHVyzDf/w6RUKic+BQutwZLjzt9TVLdFv2iA8r9azHBa6jgEpe/WQ==
X-Received: by 2002:a63:778d:: with SMTP id s135mr3848663pgc.238.1588698451129; 
 Tue, 05 May 2020 10:07:31 -0700 (PDT)
Received: from [2620:15c:17:3:3a5:23a7:5e32:4598]
 ([2620:15c:17:3:3a5:23a7:5e32:4598])
 by smtp.gmail.com with ESMTPSA id z190sm2471532pfb.1.2020.05.05.10.07.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2020 10:07:30 -0700 (PDT)
Date: Tue, 5 May 2020 10:07:29 -0700 (PDT)
From: David Rientjes <rientjes@google.com>
X-X-Sender: rientjes@chino.kir.corp.google.com
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 0/5] Statsfs: a new ram-based file sytem for Linux
 kernel statistics
In-Reply-To: <1d12f846-bf89-7b0a-5c71-e61d83b1a36f@redhat.com>
Message-ID: <alpine.DEB.2.22.394.2005051003380.216575@chino.kir.corp.google.com>
References: <20200504110344.17560-1-eesposit@redhat.com>
 <alpine.DEB.2.22.394.2005041429210.224786@chino.kir.corp.google.com>
 <f2654143-b8e5-5a1f-8bd0-0cb0df2cd638@redhat.com>
 <CALMp9eQYcLr_REzDC1kWTHX4SJWt7x+Zd1KwNvS1YGd5TVM1xA@mail.gmail.com>
 <1d12f846-bf89-7b0a-5c71-e61d83b1a36f@redhat.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 linux-s390@vger.kernel.org, kvm list <kvm@vger.kernel.org>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>, kvm-ppc@vger.kernel.org,
 Jonathan Adams <jwadams@google.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Linux FS Devel <linux-fsdevel@vger.kernel.org>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Jim Mattson <jmattson@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 5 May 2020, Paolo Bonzini wrote:

> >>> Since this is becoming a generic API (good!!), maybe we can discuss
> >>> possible ways to optimize gathering of stats in mass?
> >> Sure, the idea of a binary format was considered from the beginning in
> >> [1], and it can be done either together with the current filesystem, or
> >> as a replacement via different mount options.
> > 
> > ASCII stats are not scalable. A binary format is definitely the way to go.
> 
> I am totally in favor of having a binary format, but it should be
> introduced as a separate series on top of this one---and preferably by
> someone who has already put some thought into the problem (which
> Emanuele and I have not, beyond ensuring that the statsfs concept and
> API is flexible enough).
> 

The concern is that once this series is merged then /sys/kernel/stats 
could be considered an ABI and there would be a reasonable expectation 
that it will remain stable, in so far as the stats that userspace is 
interested in are stable and not obsoleted.

So is this a suggestion that the binary format becomes complementary to 
statsfs and provide a means for getting all stats from a single subsystem, 
or that this series gets converted to such a format before it is merged?

> ASCII stats are necessary for quick userspace consumption and for
> backwards compatibility with KVM debugfs (which is not an ABI, but it's
> damn useful and should not be dropped without providing something as
> handy), so this is what this series starts from.
> 
