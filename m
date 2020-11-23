Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 934DF2C14D2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Nov 2020 20:55:59 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CfyZN5TWMzDqRc
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Nov 2020 06:55:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::544;
 helo=mail-ed1-x544.google.com; envelope-from=morbo@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=lM5LtIU8; dkim-atps=neutral
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CfyXR3WM8zDqQ5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Nov 2020 06:54:12 +1100 (AEDT)
Received: by mail-ed1-x544.google.com with SMTP id d18so18392397edt.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Nov 2020 11:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U5QV2LmIKThd1vEJAALQZlDphDcIwS4egP/1IAOy5rU=;
 b=lM5LtIU8Yn/H9V3OBYVUI5OqQeOPFrI5cvvhgP95G1l0B9WsJGWeJu8w4PZ0HixPBb
 kSou06kUOEniyIHKqQcwY5iVTNdmCZs3v0uC7hn/OXq36Dd9gI/F+I36k6iHYaNIbgJr
 ok3O8T/FgBRxd7TJJoJAavPe6L761h+paF6XFSjn7VPzMF/iDozwHuMqQGCCT1Hii3lN
 5gAXRfJQ8lzueUQnzz6ksIRBnje+hO2+joXiask7yx6nqZhwvwWwZmSLOwS8N5kzpvDE
 Xp4ixLU6ia4Z0j9HMrKgQc1HESc5BrToHcsGAYBM6I3R/DvunUq1wiIKN0o7qd1f0aTP
 45cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U5QV2LmIKThd1vEJAALQZlDphDcIwS4egP/1IAOy5rU=;
 b=oxhYC6X04rMRRiDR+Qn5TEY6FfXOud/tEkfAIRYby4ApmX0I+iKWHqIgxVqokAbEq4
 TUkFsu7LOM/Y3Qda/dc8YtUU3sPMOctL6cTpFjEeGszZG2+eMThP6I0t7bSB9D9v+AwT
 OlVF5iEcqzHq1F9cVVnZhCLonV36V1QM4DdD98o/tjW9L4EtU8byEM5ed1si625d1qT2
 JPkTTe2FolTz4ars/J+YpPcrw5uvXRC0AnUB8o5yPwhxGD6/P9tItjlHma9iGpahcqQa
 phEDcxOrpYYwdRQGWiE9byLeCND0qWBTo8a6GZikHwMSuwuTPEq3LbyjeDPafbkUPziX
 NllA==
X-Gm-Message-State: AOAM5310lCTBVhC+zCVSp7VnqLTyh74D6FeXMDn/5SaMsfobutmII0TT
 Z+d69CfLRYaIvmXoPbsK/Byz7hyOqdA2SwlnDMmXXFeaFFkxVgg=
X-Google-Smtp-Source: ABdhPJydNpymV2XTtHRK8w0+iCRTVO3qXDP6m5x4LyBdgjx5qiZII2a+Kyg6h41ZWCsCbYM4uiAbX7xzLU9UkTk43KY=
X-Received: by 2002:aa7:cb52:: with SMTP id w18mr820250edt.362.1606161248280; 
 Mon, 23 Nov 2020 11:54:08 -0800 (PST)
MIME-Version: 1.0
References: <20201118223513.2704722-1-morbo@google.com>
 <20201120224034.191382-1-morbo@google.com>
 <20201120224034.191382-4-morbo@google.com> <87d0041vaf.fsf@mpe.ellerman.id.au>
 <20201123063432.GG2672@gate.crashing.org>
 <CAGG=3QVjSAwU+ebvH=Lk5YVMxW7=ThvkJXGPw+95nYxxuurMig@mail.gmail.com>
In-Reply-To: <CAGG=3QVjSAwU+ebvH=Lk5YVMxW7=ThvkJXGPw+95nYxxuurMig@mail.gmail.com>
From: Bill Wendling <morbo@google.com>
Date: Mon, 23 Nov 2020 11:53:55 -0800
Message-ID: <CAGG=3QUGjs2sYO2Ok3Jm8w54Pmjr4S8uAb2G+BB3zroSGghV3A@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] powerpc/64s: feature: Work around inline asm issues
To: Segher Boessenkool <segher@kernel.crashing.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Nick Desaulniers <ndesaulniers@google.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

After looking at this, I suspect that the correct change should be:

  .org . + ((label##4b-label##3b) > (label##2b-label##1b));

I'm sorry about that. I can submit another version of the patch.

-bw

On Mon, Nov 23, 2020 at 11:43 AM Bill Wendling <morbo@google.com> wrote:
>
> What Segher said. :-) Also, if you reverse the comparison, you'll get
> a build error.
>
> On Sun, Nov 22, 2020 at 10:36 PM Segher Boessenkool
> <segher@kernel.crashing.org> wrote:
> >
> > On Mon, Nov 23, 2020 at 04:44:56PM +1100, Michael Ellerman wrote:
> > > If I hard code:
> > >
> > >       .org . - (1);
> > >
> > > It fails as expected.
> > >
> > > But if I hard code:
> > >
> > >       .org . - (1 > 0);
> > >
> > > It builds?
> >
> > "true" (as a result of a comparison) in as is -1, not 1.
> >
> >
> > Segher
