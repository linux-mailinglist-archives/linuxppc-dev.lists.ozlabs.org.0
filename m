Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B869660DBA
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Jan 2023 11:22:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Npx9F2zXDz3cB1
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Jan 2023 21:22:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Q/e2Knuz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com; envelope-from=mingo.kernel.org@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Q/e2Knuz;
	dkim-atps=neutral
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Npx8F3mZXz306n
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Jan 2023 21:21:48 +1100 (AEDT)
Received: by mail-wm1-x332.google.com with SMTP id l26so2641472wme.5
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 07 Jan 2023 02:21:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bwZ6DNVnfIB+W/mkRCm0E3L/QObg6wnuFzYCkYmf6wI=;
        b=Q/e2KnuzjAKgdUkzAT7lO6QdIpWGQHJT8Xf7hjGBNvxWtNbdy66cKdafcqqs+seXr7
         P52Rjc6hF503T23rooeXa43iLYeK9CtJcLxd2pfuzYuMyFtw2pP6JXT4noaTFK3rvPO1
         GnWFjCDBLgxAz5sqVfiIknbgcozxG3Oa3vXcmSr0OvcWUgScoW1SkhE0P0HLGO3OKVGV
         yDP/SG+EaYDUnPp4FcyQPyqTpG2OJS5cn1SegSDHMCRmuup2N2Ufmq2OHxUZ8YEPLXxj
         oHQjy6+o/xzVA4qOJnU24VpAPGC3jO2NCAq2LQKAgQfyd7tfVj4gxH0OVr7fx9VSUuft
         /7xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bwZ6DNVnfIB+W/mkRCm0E3L/QObg6wnuFzYCkYmf6wI=;
        b=kqUULCsQ9oeyAEVy+A4/7lBNLogAtG6hbJLChcttm5TDuqDKiqobjyZewirvQgKVLQ
         dXBe3sA2xO8HYrkJ9bwbUQ6qWPO9Phe44EqiK9U6zBQ8teg4Q53+1qw7zNJTkjvTUQxI
         52YmdKhf8Jx2Mzsju93GmCx8RD+xyhi7a4njHn7O43jkgaWlHPkzCeWO9Zr3dUyIYuVp
         53Uty0Ux0a0eDw9Gonbu8hBt5x0w2dcwhrek1kteDJIaOS3ksEOJr5FoTiD1AsUS7wvT
         qMcNl05xLUCwagqYIMFmynDBlEHYaxFpZpdAAJKWqmgt/q1Kw5OJ4dtXwtgXgQsIgjnq
         e+4A==
X-Gm-Message-State: AFqh2krHaYxEGa7qHLECY/T4uxrPgqxd5urtdjga1FbdE12saUPO3mvn
	Qp3bBqNZOgzCC6hkslBux1Y=
X-Google-Smtp-Source: AMrXdXvgj7WJXgL/O/krYz60H4JU969uB0AKG+nlWVdeOrcW5xNqfH+0SfSwFQ+JYOrTORDecb7Z5Q==
X-Received: by 2002:a1c:4c12:0:b0:3c6:e63e:89a6 with SMTP id z18-20020a1c4c12000000b003c6e63e89a6mr41596718wmf.2.1673086901829;
        Sat, 07 Jan 2023 02:21:41 -0800 (PST)
Received: from gmail.com (1F2EF507.nat.pool.telekom.hu. [31.46.245.7])
        by smtp.gmail.com with ESMTPSA id j1-20020a05600c1c0100b003cfaae07f68sm10255499wms.17.2023.01.07.02.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jan 2023 02:21:41 -0800 (PST)
Date: Sat, 7 Jan 2023 11:21:39 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Sathvika Vasireddy <sv@linux.ibm.com>
Subject: Re: [PATCH] objtool: continue if find_insn() fails in
 decode_instructions()
Message-ID: <Y7lHsw4diDgVc9ip@gmail.com>
References: <20221208072813.25799-1-sv@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221208072813.25799-1-sv@linux.ibm.com>
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
Cc: sfr@canb.auug.org.au, peterz@infradead.org, chenzhongjin@huawei.com, linux-kernel@vger.kernel.org, aik@ozlabs.ru, mingo@redhat.com, npiggin@gmail.com, jpoimboe@redhat.com, naveen.n.rao@linux.vnet.ibm.com, mbenes@suse.cz, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


* Sathvika Vasireddy <sv@linux.ibm.com> wrote:

> Currently, decode_instructions() is failing if it is not able to find
> instruction, and this is happening since commit dbcdbdfdf137b4
> ("objtool: Rework instruction -> symbol mapping") because it is
> expecting instruction for STT_NOTYPE symbols.
> 
> Due to this, the following objtool warnings are seen:
>  [1] arch/powerpc/kernel/optprobes_head.o: warning: objtool: optprobe_template_end(): can't find starting instruction
>  [2] arch/powerpc/kernel/kvm_emul.o: warning: objtool: kvm_template_end(): can't find starting instruction
>  [3] arch/powerpc/kernel/head_64.o: warning: objtool: end_first_256B(): can't find starting instruction
> 
> The warnings are thrown because find_insn() is failing for symbols that
> are at the end of the file, or at the end of the section. Given how
> STT_NOTYPE symbols are currently handled in decode_instructions(),
> continue if the instruction is not found, instead of throwing warning
> and returning.
> 
> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
> Signed-off-by: Sathvika Vasireddy <sv@linux.ibm.com>

The SOB chain doesn't look valid: is Naveen N. Rao, the first SOB line, the 
author of the patch? If yes then a matching From: line is needed.

Or if two people developed the patch, then Co-developed-by should be used:

        Co-developed-by: First Co-Author <first@coauthor.example.org>
        Signed-off-by: First Co-Author <first@coauthor.example.org>
        Co-developed-by: Second Co-Author <second@coauthor.example.org>
        Signed-off-by: Second Co-Author <second@coauthor.example.org>

[ In this SOB sequence "Second Co-Author" is the one who submits the patch. ]

[ Please only use Co-developed-by if actual lines of code were written by 
  the co-author that created copyrightable material - it's not a courtesy 
  tag. Reviewed-by/Acked-by/Tested-by can be used to credit non-code 
  contributions. ]

Thanks,

	Ingo
