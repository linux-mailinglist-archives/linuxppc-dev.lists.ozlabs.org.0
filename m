Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 76268ACC0A
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Sep 2019 12:28:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46R6vQ5QblzDqXV
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Sep 2019 20:28:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="TDtjLmzM"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46R6sf4lQZzDqWh
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  8 Sep 2019 20:26:46 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id d15so7317607pfo.10
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 08 Sep 2019 03:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=QkYYXMpSNzYAnXgT92Zqaztp/WQ//k/Zbw8sD1YwIE8=;
 b=TDtjLmzMzMYUfGwCMnhxO8O68VZwGA06WS3pvGHpJqsOXHxl0HEZXIiOQMdco1POrN
 i9ITIc5mJhwJH39EMsgsD7mckU7IOT6B74aBSrVmtFEQQDfepcTJvqdjJl1KGzN1Ydz2
 LUqgw7lVjf71lx3baw8ZwhYayNgXNpA1Vg0b60IqF0mZfq+RrVaVfNCgQwEbQtTYrbiM
 mTJhaefFi9EyMQib8v1PXkkHkO/p2T8VTWS19T3B15/W3x2iwUAUoWT9UYI96W4CCfMt
 HoG6ep48TeyhkzeEog9PpisbiONJ5kVF82qZvC8LO7cNaOj7CkwhLfmODp4wM9xRLMMK
 9zgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=QkYYXMpSNzYAnXgT92Zqaztp/WQ//k/Zbw8sD1YwIE8=;
 b=uEuK5JZ3zAgwLriyqaYWkOcHH9fHISVaLXIrrcporLQrW70KStIOWQUCk8s+gDz1w1
 pXUKM8lCySasAFpCG/6uFSxvyVAyTxfVgshrZQpMiicvgRmgfHwyU3AM+h6F6NcSM29E
 T1YvM6CO5iUHv+C7EHSFWRzbD1iwfDFCZNyhuq9jC9m4TGDSyVuWD8SGzbsYSyZNlxnv
 7Ma3Ri3fSYGoHiyUnv8iFjzHF6+zrWRs+mrMcoAiSbN1HKvsbmzlDeLsEVQBF9FMT5+z
 3KsThyhVjwwx/+b9zqlyMS0jF+tM5yOTu2fSW4JXvLOQKwUMucU3xOFFaumkZjcwbSbf
 Qolw==
X-Gm-Message-State: APjAAAVN/YB9vdmOYxC+Pcn8Gea9LQQrLmqGoXhifjboiazEtimML5ry
 8P/wGwlVKPOg8MLbxLwe8CY=
X-Google-Smtp-Source: APXvYqyRDujvoPwW9nBBykdDv2L/FTGwjyNT49Y0aRum4eOgjc4JqeQa/t7frZl/oUw2wcLNxwXXsw==
X-Received: by 2002:a62:583:: with SMTP id 125mr22057982pff.69.1567938403196; 
 Sun, 08 Sep 2019 03:26:43 -0700 (PDT)
Received: from localhost ([203.63.189.78])
 by smtp.gmail.com with ESMTPSA id u21sm10258837pjn.5.2019.09.08.03.26.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Sep 2019 03:26:42 -0700 (PDT)
Date: Sun, 08 Sep 2019 20:25:05 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 0/3] powerpc/ftrace: Enable
 HAVE_FUNCTION_GRAPH_RET_ADDR_PTR
To: Michael Ellerman <mpe@ellerman.id.au>, "Naveen N. Rao"
 <naveen.n.rao@linux.vnet.ibm.com>, Steven Rostedt <rostedt@goodmis.org>
References: <cover.1567707399.git.naveen.n.rao@linux.vnet.ibm.com>
In-Reply-To: <cover.1567707399.git.naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1567937945.w0h0w8qaz6.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Naveen N. Rao's on September 6, 2019 4:20 am:
> Enable HAVE_FUNCTION_GRAPH_RET_ADDR_PTR for more robust stack unwinding=20
> when function graph tracer is in use. Convert powerpc show_stack() to=20
> use ftrace_graph_ret_addr() for better stack unwinding.

This series improved my case of a WARN_ON triggering in=20
trace_graph_return, the last return_to_handler entry in the stack
dump has the caller in parenthesis rather than return_to_handler.

It gives the caller, it would be nice if it could output the actual
function being traced, and then continue the caller. But at least
this is a significant improvement. Thanks for the quick turnaround.

Tested-by: Nicholas Piggin <npiggin@gmail.com>

=
