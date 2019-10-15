Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4E0D6F9D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2019 08:33:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46slxm17DfzDqYM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2019 17:33:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=axtens.net
 (client-ip=2607:f8b0:4864:20::541; helo=mail-pg1-x541.google.com;
 envelope-from=dja@axtens.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="AAAw2I6J"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46slvt70M0zDqNw
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2019 17:32:10 +1100 (AEDT)
Received: by mail-pg1-x541.google.com with SMTP id p30so11504367pgl.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2019 23:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=ocFENo40eBkOamSyXJJZMLvSNduSNIAZPjJ2SmsMR/E=;
 b=AAAw2I6JicRTwP1XQ0Mh+Yf7oGvbrwyVbwgzWtL+OohVihJM7BnkTspwNITR/85fii
 CyRw8980Lw/qYHLo0fK9SRqJB2hxVndfjPwJE0pYel9OIy3uyAJ9ws0VAx2iuFbM6Mz+
 qRU4d+kp7W/TtFg44B6fpgznp1dJM2QAK2aUo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=ocFENo40eBkOamSyXJJZMLvSNduSNIAZPjJ2SmsMR/E=;
 b=mSgYl88tT8msgFqZ/laCXdoBsyrvKyUQXEAM0jBYr4T7RLpP+MbgwfSJwdGNyCb6cR
 caMBsGnDKbjxdl293FBuERtB4yMduQ9GJA1k031SkBvU0VRGZmQnUW8/Trkmsnd3idyY
 GT1YlXVIk/EG6R7PYeGa0PbX6OhVWzApGs75mmFtYETNulHbsRRjnlVC6f6vfHwsF++p
 gtpj3t4tk6z2mWZ9YhFaZUrW5tnK5YevN1yoNnJSrcboo5VCLctAD7F6pzLQQWthrYbR
 Z51gxAUx1BDYLun1Gv9HZdUBnNZX7gjarTSAoBQyrGfsdgUjonAjgsgPLbzYiEHaraCf
 auUQ==
X-Gm-Message-State: APjAAAWf6cJNB+02DaSyEoQB6wPkEjU+aEULoaRDM16lvzdHrtoP3kcI
 0zdBgeGC4MXDUWVgEW9/KEPIIg==
X-Google-Smtp-Source: APXvYqy12kiIddn/cKAZnrFSYzEeliZZBLeUJMlvZ7ea/7DvNH++JQuArzk3aup3MdDRAMq5RabnqA==
X-Received: by 2002:a63:7405:: with SMTP id p5mr37573902pgc.264.1571121127089; 
 Mon, 14 Oct 2019 23:32:07 -0700 (PDT)
Received: from localhost (ppp167-251-205.static.internode.on.net.
 [59.167.251.205])
 by smtp.gmail.com with ESMTPSA id i1sm24230357pfg.2.2019.10.14.23.32.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2019 23:32:06 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v8 1/5] kasan: support backing vmalloc space with real
 shadow memory
In-Reply-To: <20191014152717.GA20438@lakrids.cambridge.arm.com>
References: <20191001065834.8880-1-dja@axtens.net>
 <20191001065834.8880-2-dja@axtens.net>
 <352cb4fa-2e57-7e3b-23af-898e113bbe22@virtuozzo.com>
 <87ftjvtoo7.fsf@dja-thinkpad.axtens.net>
 <20191014152717.GA20438@lakrids.cambridge.arm.com>
Date: Tue, 15 Oct 2019 17:32:03 +1100
Message-ID: <875zkqtt7g.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: gor@linux.ibm.com, x86@kernel.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-mm@kvack.org, glider@google.com,
 luto@kernel.org, Andrey Ryabinin <aryabinin@virtuozzo.com>,
 linuxppc-dev@lists.ozlabs.org, dvyukov@google.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


> There is a potential problem here, as Will Deacon wrote up at:
>
>   https://lore.kernel.org/linux-arm-kernel/20190827131818.14724-1-will@kernel.org/
>
> ... in the section starting:
>
> | *** Other architecture maintainers -- start here! ***
>
> ... whereby the CPU can spuriously fault on an access after observing a
> valid PTE.
>
> For arm64 we handle the spurious fault, and it looks like x86 would need
> something like its vmalloc_fault() applying to the shadow region to
> cater for this.

I'm not really up on x86 - my first thought would be that their stronger
memory ordering might be sufficient but I really don't know. Reading the
thread I see arm and powerpc discussions but nothing from anyone else,
so I'm none the wiser there...

Andy, do you have any thoughts?

Regards,
Daniel

>
> Thanks,
> Mark.
