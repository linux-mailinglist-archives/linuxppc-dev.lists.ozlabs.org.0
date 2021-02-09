Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 26109315117
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 15:00:59 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZl0f2GLlzDrWV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Feb 2021 01:00:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4DZksB2YnvzDspH
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Feb 2021 00:54:21 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 119Dot0b023626;
 Tue, 9 Feb 2021 07:50:55 -0600
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 119DorgE023625;
 Tue, 9 Feb 2021 07:50:53 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Tue, 9 Feb 2021 07:50:53 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v5 20/22] powerpc/syscall: Avoid storing 'current' in
 another pointer
Message-ID: <20210209135053.GD27854@gate.crashing.org>
References: <cover.1612796617.git.christophe.leroy@csgroup.eu>
 <24804747098369ebcdac38970b8f7a1260bdd248.1612796617.git.christophe.leroy@csgroup.eu>
 <1612838134.rvncv9kzls.astroid@bobo.none>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1612838134.rvncv9kzls.astroid@bobo.none>
User-Agent: Mutt/1.4.2.3i
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
Cc: linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 msuchanek@suse.de, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 09, 2021 at 12:36:20PM +1000, Nicholas Piggin wrote:
> What if you did this?

> +static inline struct task_struct *get_current(void)
> +{
> +	register struct task_struct *task asm ("r2");
> +
> +	return task;
> +}

Local register asm variables are *only* guaranteed to live in that
register as operands to an asm.  See
  https://gcc.gnu.org/onlinedocs/gcc/Local-Register-Variables.html#Local-Register-Variables
("The only supported use" etc.)

You can do something like

static inline struct task_struct *get_current(void)
{
	register struct task_struct *task asm ("r2");

	asm("" : "+r"(task));

	return task;
}

which makes sure that "task" actually is in r2 at the point of that asm.


Segher
