Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C5871662BC5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 17:54:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NrKls57Cyz3cDs
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 03:54:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=mZKdUV+Q;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com; envelope-from=mingo.kernel.org@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=mZKdUV+Q;
	dkim-atps=neutral
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NrKky3GPsz3bT4
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jan 2023 03:53:12 +1100 (AEDT)
Received: by mail-wr1-x429.google.com with SMTP id az7so8844740wrb.5
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Jan 2023 08:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I6M2f+5hl6ycxEpjBTo7pStxA/gUi5ADO0lMaKR9JFY=;
        b=mZKdUV+QJVvlJnUlNUoT/kQoNbhSpp8TKFDoQbtzA9ccRgsHV1ngpLYb+wD3q5+qZI
         xdkaS/XCfHHymFPKkFxH55jQh13D+9YuCtBsLlRcFut0+UeE6MZg6MkPf+nsZM7x3EYG
         7HPnbDHTVZ3GNtS7maefT3yS7dDK02BGF/HUwkhM5UYokRVLzn53LGx3ruNNSMvPEqry
         kfOPqTD5VgBnnV9ZjKTkyTot51lduB7tUvTh4ZSeiU3r1eVROkloGQDmm+uCRDJE5dsk
         XjqqXsahAqBRoeV9juBgLUiOMGnHu/riQCeclPMP3eJd3DUG6gX4xGoJsAV2A5j2Gnh+
         r5wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I6M2f+5hl6ycxEpjBTo7pStxA/gUi5ADO0lMaKR9JFY=;
        b=Hr9Ag0I3WLtvQWHjrXR8OJjsHonNloLruYU+sFKDCWgbnASagfbpi8ZNQ9CBQzWmZw
         bPqKeNr3bKAJfl34VFsYPkbf3Z5cu3CNfC6nLrm1iXuDgxtth7p9xP4NgCUrj7Ef/bNc
         Gagb47ZKXtqE8EgqoS05wXyVT2+GMzKorCKjIU32tvkIFdcfMOyKDF9Bz3uukRX3+9gV
         0N3nCPsSRNylcvF2BPofGxwzuWJb3K42nAmPnPwpfXeZtuFoKnY155gCvFOjIa9uVwrR
         8W8X7v2bLt48gCrs8rc7uZfNv/34SQ5KG3yn569JuFWSJdWyqT2AgmAW4s3SBwk/SAzn
         rfvQ==
X-Gm-Message-State: AFqh2kpNyxI3DZm52Iz/3T6atycHANqKvk5x3XJkzerHUpBxbrpPNagQ
	aJbmR8WB3WQscvqWqCb7wIY=
X-Google-Smtp-Source: AMrXdXsJJiszUF3JuTTX8Nmf8vVy4QgNmyu5UjoEDDbrHTlDop789Gmv81KRUfztvkaV2pEktbZHlA==
X-Received: by 2002:adf:e3d2:0:b0:299:51c8:5297 with SMTP id k18-20020adfe3d2000000b0029951c85297mr17551617wrm.66.1673283189102;
        Mon, 09 Jan 2023 08:53:09 -0800 (PST)
Received: from gmail.com ([31.46.247.25])
        by smtp.gmail.com with ESMTPSA id bp28-20020a5d5a9c000000b00273cd321a1bsm9058068wrb.107.2023.01.09.08.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 08:53:08 -0800 (PST)
Date: Mon, 9 Jan 2023 17:53:04 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Sathvika Vasireddy <sv@linux.ibm.com>
Subject: Re: [PATCH] objtool: continue if find_insn() fails in
 decode_instructions()
Message-ID: <Y7xGas4FAHFUtEJE@gmail.com>
References: <20221208072813.25799-1-sv@linux.ibm.com>
 <Y7lHsw4diDgVc9ip@gmail.com>
 <623307fe-a29a-c691-b07b-4d2168d4bdcc@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <623307fe-a29a-c691-b07b-4d2168d4bdcc@linux.ibm.com>
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

> Hi Ingo, Happy New Year!

Happy New Year to you too! :-)

> On 07/01/23 15:51, Ingo Molnar wrote:
> > * Sathvika Vasireddy <sv@linux.ibm.com> wrote:
> > 
> > > Currently, decode_instructions() is failing if it is not able to find
> > > instruction, and this is happening since commit dbcdbdfdf137b4
> > > ("objtool: Rework instruction -> symbol mapping") because it is
> > > expecting instruction for STT_NOTYPE symbols.
> > > 
> > > Due to this, the following objtool warnings are seen:
> > >   [1] arch/powerpc/kernel/optprobes_head.o: warning: objtool: optprobe_template_end(): can't find starting instruction
> > >   [2] arch/powerpc/kernel/kvm_emul.o: warning: objtool: kvm_template_end(): can't find starting instruction
> > >   [3] arch/powerpc/kernel/head_64.o: warning: objtool: end_first_256B(): can't find starting instruction
> > > 
> > > The warnings are thrown because find_insn() is failing for symbols that
> > > are at the end of the file, or at the end of the section. Given how
> > > STT_NOTYPE symbols are currently handled in decode_instructions(),
> > > continue if the instruction is not found, instead of throwing warning
> > > and returning.
> > > 
> > > Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
> > > Signed-off-by: Sathvika Vasireddy <sv@linux.ibm.com>
> > The SOB chain doesn't look valid: is Naveen N. Rao, the first SOB line, the
> > author of the patch? If yes then a matching From: line is needed.
> > 
> > Or if two people developed the patch, then Co-developed-by should be used:
> > 
> >          Co-developed-by: First Co-Author <first@coauthor.example.org>
> >          Signed-off-by: First Co-Author <first@coauthor.example.org>
> >          Co-developed-by: Second Co-Author <second@coauthor.example.org>
> >          Signed-off-by: Second Co-Author <second@coauthor.example.org>
> > 
> > [ In this SOB sequence "Second Co-Author" is the one who submits the patch. ]
> > 
> > [ Please only use Co-developed-by if actual lines of code were written by
> >    the co-author that created copyrightable material - it's not a courtesy
> >    tag. Reviewed-by/Acked-by/Tested-by can be used to credit non-code
> >    contributions. ]
> Thank you for the clarification, and for bringing these points to my
> attention. I'll keep these things in mind. In this case, since both Naveen
> N. Rao and I developed the patch, the below tags
> are applicable.
> 
>         Co-developed-by: First Co-Author <first@coauthor.example.org>
>         Signed-off-by: First Co-Author <first@coauthor.example.org>
>         Co-developed-by: Second Co-Author <second@coauthor.example.org>
>         Signed-off-by: Second Co-Author <second@coauthor.example.org>

... while filling in your real names & email addresses I suppose. ;-)

> 
> However, I would be dropping this particular patch, since I think Nick's
> patch [1] is better to fix the objtool issue.
> 
> [1] - https://lore.kernel.org/linuxppc-dev/20221220101323.3119939-1-npiggin@gmail.com/

Ok, I'll pick up Nick's fix, with these tags added for the PowerPC 
regression aspect and your review:

  Reported-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
  Reported-by: Sathvika Vasireddy <sv@linux.ibm.com>
  Acked-by: Sathvika Vasireddy <sv@linux.ibm.com>

To document & credit the efforts of your patch.

Thanks,

	Ingo
