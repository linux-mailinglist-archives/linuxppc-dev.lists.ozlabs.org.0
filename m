Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 679B34EA0E6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Mar 2022 22:00:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KS3T82YNwz3c1v
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Mar 2022 07:00:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Q4W5mxp8;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Q4W5mxp8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=jpoimboe@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=Q4W5mxp8; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=Q4W5mxp8; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KS3SQ2R8Cz30CL
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Mar 2022 06:59:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648497566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rNlkcdDOnbEEqyaA/TedcvXNhWifU9B0NNWARWuI3n8=;
 b=Q4W5mxp8IzvQnXAFA4pXr4iq6DFjrZ3uAYshzd2RmqwmQCfufN9DG/sm0/uQbJh0ck7W8z
 YvmcNHOW6IY+7u8JXVg7aKdOc7xJ4qOsOimQp7dSRHgrafHDWVgaNJc1R9k9wjW4JJ0EhK
 kp2Nl2JvQRYFtW8W03tBLCLhIfmOyCA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648497566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rNlkcdDOnbEEqyaA/TedcvXNhWifU9B0NNWARWuI3n8=;
 b=Q4W5mxp8IzvQnXAFA4pXr4iq6DFjrZ3uAYshzd2RmqwmQCfufN9DG/sm0/uQbJh0ck7W8z
 YvmcNHOW6IY+7u8JXVg7aKdOc7xJ4qOsOimQp7dSRHgrafHDWVgaNJc1R9k9wjW4JJ0EhK
 kp2Nl2JvQRYFtW8W03tBLCLhIfmOyCA=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-608-tQSopsRcOWioCsQLqgTnTA-1; Mon, 28 Mar 2022 15:59:24 -0400
X-MC-Unique: tQSopsRcOWioCsQLqgTnTA-1
Received: by mail-qv1-f71.google.com with SMTP id
 cl19-20020a05621404f300b0044103143211so12136186qvb.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Mar 2022 12:59:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rNlkcdDOnbEEqyaA/TedcvXNhWifU9B0NNWARWuI3n8=;
 b=EyC23pWkJBAPbUMSTSdaywHyS4VHLPPfWwfmtE753YRUvAdZJvB9Os2IFSIRSyTNOz
 ZZD9JcMn/Hf+9xbnT0j+tAttgtTdMDZUSXSK6oi3COJd/Ept2/zYdUlz8svLXecuYD5v
 4p23Ckicw9JZjfefaGos1tzb/Mg7AhBx93isWvT9HRiMb9T1RN5Y9z6M3WE13PCCvaSk
 M61qjWFNKEkdmyiUYJB/YfaSYsS+3dvgN0aA24s8ZHcpWDwNoy/wwkwTaDz3qpoOoHw6
 DzdrvPAIwaORq1/8CGIQNmMILCPgl69jc0QgIrY+m/zM+IRAo3wUX+XXwZXqgIcWP8oY
 i35A==
X-Gm-Message-State: AOAM533gec3h8dcI364jOcPxNtv/th7aCGpWa0nVsvRL6F786dvKmk/U
 Z5ask3pYBjynFSmsxDl9m/eb/IyNbdn0ynLVNW77cveM/wZrMU/4Aw5r2Ax/iP1DGXhbhuaNZmt
 z3zMS63zX3GWGK8s9C6kGKHxytg==
X-Received: by 2002:ac8:5cc1:0:b0:2e1:bd05:1371 with SMTP id
 s1-20020ac85cc1000000b002e1bd051371mr23484910qta.573.1648497564275; 
 Mon, 28 Mar 2022 12:59:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx9L8BI7elUtjtShDyTNCfyVyjEHPEC/OaWfgPxbM34Cf9QU+7w8TC2BCSK0jUFIPEMZj6Lpw==
X-Received: by 2002:ac8:5cc1:0:b0:2e1:bd05:1371 with SMTP id
 s1-20020ac85cc1000000b002e1bd051371mr23484900qta.573.1648497564027; 
 Mon, 28 Mar 2022 12:59:24 -0700 (PDT)
Received: from treble ([2600:1700:6e32:6c00::35])
 by smtp.gmail.com with ESMTPSA id
 z15-20020a05622a060f00b002e2070bf899sm12526007qta.90.2022.03.28.12.59.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 12:59:23 -0700 (PDT)
Date: Mon, 28 Mar 2022 12:59:20 -0700
From: Josh Poimboeuf <jpoimboe@redhat.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [RFC PATCH 3/3] objtool/mcount: Add powerpc specific functions
Message-ID: <20220328195920.dqlfra3lcardko6r@treble>
References: <20220318105140.43914-1-sv@linux.ibm.com>
 <20220318105140.43914-4-sv@linux.ibm.com>
 <YjR6kHq4c/rjCTpr@hirez.programming.kicks-ass.net>
 <0b55f122-4760-c1ba-840a-0911cefec2ad@csgroup.eu>
MIME-Version: 1.0
In-Reply-To: <0b55f122-4760-c1ba-840a-0911cefec2ad@csgroup.eu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jpoimboe@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>, "aik@ozlabs.ru" <aik@ozlabs.ru>,
 Sathvika Vasireddy <sv@linux.ibm.com>,
 "naveen.n.rao@linux.vnet.ibm.com" <naveen.n.rao@linux.vnet.ibm.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Mar 27, 2022 at 09:09:20AM +0000, Christophe Leroy wrote:
> Second point is the endianess and 32/64 selection, especially when 
> crossbuilding. There is already some stuff regarding endianess based on 
> bswap_if_needed() but that's based on constant selection at build time 
> and I couldn't find an easy way to set it conditionaly based on the 
> target being built.
>
> Regarding 32/64 selection, there is almost nothing, it's based on using 
> type 'long' which means that at the time being the target and the build 
> platform must both be 32 bits or 64 bits.
> 
> For both cases (endianess and 32/64) I think the solution should 
> probably be to start with the fileformat of the object file being 
> reworked by objtool.

Do we really need to detect the endianness/bitness at runtime?  Objtool
is built with the kernel, why not just build-in the same target
assumptions as the kernel itself?

> What are current works in progress on objtool ? Should I wait Josh's 
> changes before starting looking at all this ? Should I wait for anything 
> else ?

I'm not making any major changes to the code, just shuffling things
around to make the interface more modular.  I hope to have something
soon (this week).  Peter recently added a big feature (Intel IBT) which
is already in -next.

Contributions are welcome, with the understanding that you'll help
maintain it ;-)

Some years ago Kamalesh Babulal had a prototype of objtool for ppc64le
which did the full stack validation.  I'm not sure what ever became of
that.

FWIW, there have been some objtool patches for arm64 stack validation,
but the arm64 maintainers have been hesitant to get on board with
objtool, as it brings a certain maintenance burden.  Especially for the
full stack validation and ORC unwinder.  But if you only want inline
static calls and/or mcount then it'd probably be much easier to
maintain.

-- 
Josh

