Return-Path: <linuxppc-dev+bounces-3761-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACBF9E30B4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Dec 2024 02:20:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y307f6w2rz2yRP;
	Wed,  4 Dec 2024 12:20:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733275214;
	cv=none; b=aMWHjDZ4odGgZtDHdcT7dSXeFy0OLYoMlA5C5uDFN0cbTSZNbrc5R3SKrU/YaGxpwPGQXspSgHeow/q9+Mw/AWaDQdeNUggfWBRfoWrscIZ+jc7g+S/nV3A3yOaCejk+ZZqA52kOzkHOOynPi3R4xi/mZDSi5gDcwAic66aYNyOLytaDSA/AhmZv6YDZdJDWjrl7CoOodlwxkcr5WUGfXWgEjz9Q1dzDChuTsmeYKJKwe+JTlXFdJODb05XMNq4KhB+/2D53V3v/0N3HA059MSkEJb2GjnXpRiBEYyr0UsX+zAbthoXF7fzDNG6VN+SDmQ6livUVBdcRJZfKU9Zmng==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733275214; c=relaxed/relaxed;
	bh=PRu/6Qr31/VlXUVk5BP2fCYP7enzMvcZMZ0rZw5VHXk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=di2TPGSOKm3Wo5bXCwEWjYnJ8dDXaNhYa+4hSEQxtxJhVGHluLaDBCVUboGddoxZPapLjJGD3pCcquYxW/bxN6xkFEBOuE4xBXMvsG5LziZkkBUp1+doeZUoMIfXTN6PutS78j04lyWwNncQS+k+zcSNDGpBc4WjN3vu7zJPPQrlMOOZ9FbCuFpSY395sDeMdbSPs+4NQvO4yft9T/gkbaOCBVmosj7uBsL8zYI5/KwwD73tSoq50O+aPeoLc48YokriOzOBzr8hot1svSXnrFWbVSjugII0GozG2djh2RX/gK9hOzfUK5dKvcjLv+F9Sam3u9vZOjwlaXj7rMI4Uw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=srs0=3i1i=s5=goodmis.org=rostedt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=srs0=3i1i=s5=goodmis.org=rostedt@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y307c1ZcSz2xvh
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Dec 2024 12:20:12 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4A619A41697;
	Wed,  4 Dec 2024 01:18:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0817C4CEDC;
	Wed,  4 Dec 2024 01:20:06 +0000 (UTC)
Date: Tue, 3 Dec 2024 20:20:08 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Hari Bathini <hbathini@linux.ibm.com>, Shuah Khan <shuah@kernel.org>,
 linux-kselftest@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, "Naveen N. Rao" <naveen@kernel.org>, linuxppc-dev
 <linuxppc-dev@lists.ozlabs.org>, linux-trace-kernel@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] selftests/ftrace: adjust offset for kprobe syntax
 error test
Message-ID: <20241203202008.1f30a266@gandalf.local.home>
In-Reply-To: <fa1e747f-1823-4d20-86c0-b85a3b959952@linuxfoundation.org>
References: <20241129202621.721159-1-hbathini@linux.ibm.com>
	<20241202144111.75d1bb3b@gandalf.local.home>
	<fa1e747f-1823-4d20-86c0-b85a3b959952@linuxfoundation.org>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, 3 Dec 2024 18:01:06 -0700
Shuah Khan <skhan@linuxfoundation.org> wrote:

> On 12/2/24 12:41, Steven Rostedt wrote:
> > On Sat, 30 Nov 2024 01:56:21 +0530
> > Hari Bathini <hbathini@linux.ibm.com> wrote:
> >   
> >> In 'NOFENTRY_ARGS' test case for syntax check, any offset X of
> >> `vfs_read+X` except function entry offset (0) fits the criterion,
> >> even if that offset is not at instruction boundary, as the parser
> >> comes before probing. But with "ENDBR64" instruction on x86, offset
> >> 4 is treated as function entry. So, X can't be 4 as well. Thus, 8
> >> was used as offset for the test case. On 64-bit powerpc though, any
> >> offset <= 16 can be considered function entry depending on build
> >> configuration (see arch_kprobe_on_func_entry() for implementation
> >> details). So, use `vfs_read+20` to accommodate that scenario too.
> >>
> >> Suggested-by: Masami Hiramatsu <mhiramat@kernel.org>
> >> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>  
> > 
> > Acked-by: Steven Rostedt (Google) <rostedt@goodmis.org>
> > 
> > Shuah,
> > 
> > Can you take this through your tree?  
> 
> Yes I can take it. I do have question about whether this is
> a fix - sounds like it is from the change log.
> 
> Clearly stating that it is a fix will help so it can be picked
> up for stables.

I would say it's a fix, as the test currently fails in certain scenarios
for powerpc.

You can add:

Fixes: 4231f30fcc34a ("selftests/ftrace: Add BTF arguments test cases")

-- Steve

