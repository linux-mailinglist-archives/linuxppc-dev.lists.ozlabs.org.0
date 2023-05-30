Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 724587157F6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 May 2023 10:07:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QVlNn2pTMz3fHG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 May 2023 18:07:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=Ki27RLJO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=2001:67c:2178:6::1c; helo=smtp-out1.suse.de; envelope-from=pmladek@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=Ki27RLJO;
	dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QVlMw4jKKz3cD5
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 May 2023 18:06:19 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id 840A5219D0;
	Tue, 30 May 2023 08:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1685433969; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ukbl4q0oH8kV5ZgAOr0o4FI9d9WKzL+MxA+Kz6z5tX8=;
	b=Ki27RLJOVorsjFnZmsstxVVQLhIFGev9cVJFWAktH3fgZ0qOHDJ9BvIxzHbCJQy82azP4J
	ZU8IGGZx7BvXTz+b986cSjh9v5EdcOPRMy3+dezyb5lUdXdAsFq0U/0oz3Tipcf7TG2jIN
	R8qZHj8zF2i2u7kdJP0/H2YRf/vncdY=
Received: from suse.cz (unknown [10.100.201.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id 237672C141;
	Tue, 30 May 2023 08:06:08 +0000 (UTC)
Date: Tue, 30 May 2023 10:06:07 +0200
From: Petr Mladek <pmladek@suse.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Subject: Re: [PATCH 1/1] arch:hexagon/powerpc: use KSYM_NAME_LEN in array size
Message-ID: <ZHWub0ibU7etLnXK@alley>
References: <20230529052821.58175-1-maninder1.s@samsung.com>
 <CGME20230529052832epcas5p4fa1b8cf25d9810d32bd2ccf012086fb3@epcms5p1>
 <CANiq72ncDr68qeahrHuQ63dj1Va3=Us6ZSjGRkr6Zp8j+=yH_Q@mail.gmail.com>
 <20230529105707epcms5p1418eac680ebe1736196706b0db80dd39@epcms5p1>
 <CANiq72n_eso7_pgna8ukmEnuCQPsKYPr0NU-Ss9Nwv0VzX=etg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72n_eso7_pgna8ukmEnuCQPsKYPr0NU-Ss9Nwv0VzX=etg@mail.gmail.com>
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
Cc: "nathanl@linux.ibm.com" <nathanl@linux.ibm.com>, "bcain@quicinc.com" <bcain@quicinc.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, "keescook@chromium.org" <keescook@chromium.org>, "gary@garyguo.net" <gary@garyguo.net>, Onkarnath <onkarnath.1@samsung.com>, "ustavoars@kernel.org" <ustavoars@kernel.org>, "npiggin@gmail.com" <npiggin@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Steven Rostedt <rostedt@goodmis.org>, "ojeda@kernel.org" <ojeda@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>, "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>, maninder1.s@samsung.com, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon 2023-05-29 16:50:45, Miguel Ojeda wrote:
> On Mon, May 29, 2023 at 1:08 PM Maninder Singh <maninder1.s@samsung.com> wrote:
> >
> > I Will add co-developed-by` tag.
> > because this change was identified while we were working on kallsyms some time back.
> > https://lore.kernel.org/lkml/YonTOL4zC4CytVrn@infradead.org/t/
> >
> > this patch set is pending and we will start working on that again, so i thought better
> > to send bugfix first.
> 
> Sounds good to me!
> 
> (Fixed Wedson's email address)
> 
> > Yes, I think second buffer was not related to kallsyms, so I have not touched that.
> 
> Kees: what is the current stance on `[static N]` parameters? Something like:
> 
>     const char *kallsyms_lookup(unsigned long addr,
>                                 unsigned long *symbolsize,
>                                 unsigned long *offset,
>     -                           char **modname, char *namebuf);
>     +                           char **modname, char namebuf[static
> KSYM_NAME_LEN]);
> 
> makes the compiler complain about cases like these (even if trivial):
> 
>     arch/powerpc/xmon/xmon.c:1711:10: error: array argument is too small;
>         contains 128 elements, callee requires at least 512
> [-Werror,-Warray-bounds]
>             name = kallsyms_lookup(pc, &size, &offset, NULL, tmpstr);
>                  ^                                           ~~~~~~
>     ./include/linux/kallsyms.h:86:29: note: callee declares array
> parameter as static here
>             char **modname, char namebuf[static KSYM_NAME_LEN]);
>                                  ^      ~~~~~~~~~~~~~~~~~~~~~~
> 
> But I only see 2 files in the kernel using `[static N]` (from 2020 and
> 2021). Should something else be used instead (e.g. `__counted_by`),
> even if constexpr-sized?.
> 
> Also, I went through the other callers to `kallsyms_lookup` to see
> other issues -- one I am not sure about is `fetch_store_symstring` in
> `kernel/trace/trace_probe_tmpl.h`. Steven/Masami: is that "with max
> length" in the function docs enough? Is it 0xffff?

The best solution would be to pass the buffer size as an extra
parameter. Especially when some code passes buffers that are
allocated/reserved dynamically.

Sigh, I am not sure how many changes it would require in kallsyms
API and all the callers. But it would be really appreciated, IMHO.

Best Regards,
Petr
