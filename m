Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9934DE500
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Mar 2022 02:37:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KL3QL30hvz3bT1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Mar 2022 12:36:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RViEmeOl;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RViEmeOl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=jpoimboe@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=RViEmeOl; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=RViEmeOl; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KL3PY4L15z2yh9
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Mar 2022 12:36:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647653772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3Yhdauiv/hGwfTz79ujnlgoXkowLnIQTmrPreufHZAY=;
 b=RViEmeOlyfSTvG4mu9sQluyaaNjVgGJ4dCXs5Rftn45R08HXKt+RL04jsA9814FlRyrPKU
 5T62fM/nV1wthGqFgKaIe4STRObR4apHOXypvcsdOddqFR0ZBch7LjT1k9C0tAQxnHTd/x
 dCVJxn5wDrTt2XW5HzgUcaacTUM1WVY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647653772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3Yhdauiv/hGwfTz79ujnlgoXkowLnIQTmrPreufHZAY=;
 b=RViEmeOlyfSTvG4mu9sQluyaaNjVgGJ4dCXs5Rftn45R08HXKt+RL04jsA9814FlRyrPKU
 5T62fM/nV1wthGqFgKaIe4STRObR4apHOXypvcsdOddqFR0ZBch7LjT1k9C0tAQxnHTd/x
 dCVJxn5wDrTt2XW5HzgUcaacTUM1WVY=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-86-852_xSx6OvuNaKN09JwDOA-1; Fri, 18 Mar 2022 21:35:40 -0400
X-MC-Unique: 852_xSx6OvuNaKN09JwDOA-1
Received: by mail-qv1-f70.google.com with SMTP id
 t16-20020ad44850000000b00440e0f2a561so5632775qvy.11
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Mar 2022 18:35:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3Yhdauiv/hGwfTz79ujnlgoXkowLnIQTmrPreufHZAY=;
 b=JSje+UIFGSzj3HT64hI54wfzicxfJnWnLwKizN+ght3YS5DbdmLw2C3kaF4cJOwOdd
 gIcLmacq8W4weQfNwRw6pnYV3TxNxpnOy4yMg0zwAZEMmGVE9Yal70VOutwviuuet0R5
 CqxCMFPhmAazKtMXLUrhthgOh72uO+o0APYnTvv9Qa4uFAI+6OsGR6Ru+6YWI7aYiPoL
 qFFhVCdC1fxucHdKBEG31Xw7IyRvJ7mYFLKUQ3N1qu7otDfXEW8rGKePkks/RcrNet16
 yUqI++8AepyyzWnQbrgFpjM6Wc9Z/SDd4XEV0Nm7m6IsyRQU5KCeLRz315fMAEI2gtLZ
 lMow==
X-Gm-Message-State: AOAM531xkX/UF4pEtHQSEoR0+OAc6iGRk1cl0JYXyqL1ZfcbDqtsaEFI
 cWcSMM8tep5oFKhkd1gnPrSQKLs+gLiC3/pP7oG3+zpQ+GC8Sz0kxZB2bw8lVg93JhMNcty7UvF
 BLe3v2X6KNk1ig4S7+xHbDBpqVQ==
X-Received: by 2002:a05:6214:262a:b0:440:d51b:71d8 with SMTP id
 gv10-20020a056214262a00b00440d51b71d8mr8957947qvb.58.1647653740082; 
 Fri, 18 Mar 2022 18:35:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyFZ8FUzHQ/tF7I6xSgadbQibeZis7TglzPOIMyT0wgA1z0OwQ5PrduuzpXsh1YaDRWwJmJfQ==
X-Received: by 2002:a05:6214:262a:b0:440:d51b:71d8 with SMTP id
 gv10-20020a056214262a00b00440d51b71d8mr8957931qvb.58.1647653739643; 
 Fri, 18 Mar 2022 18:35:39 -0700 (PDT)
Received: from treble ([2600:1700:6e32:6c00::45])
 by smtp.gmail.com with ESMTPSA id
 n7-20020a05622a040700b002e1b8be0985sm6436353qtx.35.2022.03.18.18.35.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Mar 2022 18:35:39 -0700 (PDT)
Date: Fri, 18 Mar 2022 18:35:36 -0700
From: Josh Poimboeuf <jpoimboe@redhat.com>
To: Sathvika Vasireddy <sv@linux.ibm.com>
Subject: Re: [RFC PATCH 0/3] objtool: Add mcount sub-command
Message-ID: <20220319013536.v2syx2ru7ijuvw23@treble>
References: <20220318105140.43914-1-sv@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20220318105140.43914-1-sv@linux.ibm.com>
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
Cc: peterz@infradead.org, linux-kernel@vger.kernel.org, rostedt@goodmis.org,
 aik@ozlabs.ru, naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 18, 2022 at 04:21:37PM +0530, Sathvika Vasireddy wrote:
> This patchset adds support to implement 'objtool mcount' command.
> 
> Right now, objtool is built if CONFIG_STACK_VALIDATION is enabled.
> And, '__mcount_loc' section is generated by objtool when --mcount 
> option is passed to check sub-command. 
> 
> For architectures to be able to generate '__mcount_loc' section
> without having to do stack validation, introduce 'mcount' as
> a sub-command to objtool. This way, objtool is built for mcount 
> if CONFIG_FTRACE_MCOUNT_USE_OBJTOOL is enabled. Additionally, 
> architectures can select HAVE_NOP_MCOUNT to be able to nop out
> mcount call sites.  
> 
> TODO: Enable "objtool mcount" for clang LTO builds.
> 
> Sathvika Vasireddy (3):
>   objtool: Move common code to utils.c
>   objtool: Enable and implement 'mcount' subcommand
>   objtool/mcount: Add powerpc specific functions

Hi Sathvika,

Thanks for the patches!

I have some other patches in progress which will rework the objtool
interface by modularizing the cmdline options, so that each option can
be specified either individually or in combination.  Even stack
validation itself will be its own separate option.

I think it will help your situation as well: "objtool run --mcount" will
only do '__mcount_loc' generation and nothing else.

Something like so:

$ ./objtool run --help

 Usage: objtool run [<options>] file.o

Commands (at least one required):
    -a, --uaccess         validate uaccess
    -c, --static-call     annotate static calls
    -i, --ibt             validate and annotate IBT
    -m, --mcount          generate '__mcount_loc' section
    -n, --noinstr         validate noinstr
    -o, --orc             generate ORC metadata
    -r, --retpoline       validate retpoline usage
    -S, --sls             validate straight-line-speculation mitigation
    -s, --stack-val       validate stack metadata

Options:
        --backtrace       unwind on error
        --backup          create .orig files before modification
        --dry-run         don't write the modifications
        --fp              object uses frame pointers
        --module          object will be part of a kernel module
        --no-unreachable  skip 'unreachable instruction' warnings
        --stats           print statistics
        --vmlinux         object is vmlinux.o


Hopefully I'll have the patches ready soon.

-- 
Josh

