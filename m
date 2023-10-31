Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 778F27DD194
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Oct 2023 17:30:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SKbGf3Jv5z3cft
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Nov 2023 03:30:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SKbG81YZVz3c5Y
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Nov 2023 03:30:07 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 39VGOmMW007176;
	Tue, 31 Oct 2023 11:24:48 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 39VGOl1e007175;
	Tue, 31 Oct 2023 11:24:47 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Tue, 31 Oct 2023 11:24:47 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [pci:controller/xilinx-xdma] BUILD REGRESSION 8d786149d78c7784144c7179e25134b6530b714b
Message-ID: <20231031162447.GB19790@gate.crashing.org>
References: <202310282050.Y5D8ZPCw-lkp@intel.com> <20231031145600.GA9161@bhelgaas>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231031145600.GA9161@bhelgaas>
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
Cc: kernel test robot <lkp@intel.com>, linux-pci@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor <nathan@kernel.org>, linuxppc-dev@lists.ozlabs.org, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Oct 31, 2023 at 09:56:00AM -0500, Bjorn Helgaas wrote:
> That said, the unused functions do look legit:
> 
> grackle_set_stg() is a static function and the only call is under
> "#if 0".

It is a static inline.  It is *normal* that that is uncalled.  It is
very similar to a macro that has no invocation.  The warning is
overeager.


Segher
